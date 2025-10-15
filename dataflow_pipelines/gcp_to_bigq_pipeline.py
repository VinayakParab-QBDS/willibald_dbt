import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
import argparse
from google.cloud import storage

# -----------------------------
# Helper Functions
# -----------------------------

def read_gcs_header(gcs_path, delimiter=','):
    """
    Reads the first line (header) from a CSV in GCS.
    """
    path_parts = gcs_path.replace("gs://", "").split("/", 1)
    bucket_name = path_parts[0]
    blob_name = path_parts[1]

    client = storage.Client()
    blob = client.bucket(bucket_name).blob(blob_name)
    header_line = blob.download_as_text().split("\n")[0]
    # headers = header_line.strip().split(delimiter)
    headers = [h.replace('\ufeff', '') for h in header_line.strip().split(delimiter)]
    return headers

def infer_bq_schema_from_header(headers):
    """
    Returns a comma-separated string, e.g., "col1:STRING, col2:STRING"
    """
    return ', '.join([f"{col}:STRING" for col in headers])

# -----------------------------
# Beam DoFn
# -----------------------------

class ParseCSV(beam.DoFn):
    def process(self, element, headers, delimiter=','):
        fields = element.split(delimiter)
        record = dict(zip(headers, fields))
        yield record

# -----------------------------
# Pipeline
# -----------------------------

def run(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True)           # e.g., gs://bucket/raw/file.csv
    parser.add_argument('--table_name', required=True)      # e.g., my_table
    parser.add_argument('--dataset', required=True)         # e.g., raw
    parser.add_argument('--project', required=True)         # e.g., my-gcp-project
    parser.add_argument('--temp_location', required=True)   # e.g., gs://bucket/tmp
    parser.add_argument('--region', required=True)          # e.g., europe-west3
    parser.add_argument('--delimiter', default=';')
    parser.add_argument('--skip_header_rows', default='1')
    args, beam_args = parser.parse_known_args(argv)

    # Read header from GCS and infer schema
    headers = read_gcs_header(args.input, args.delimiter)
    schema_str = infer_bq_schema_from_header(headers)
    print(f"Inferred schema: {schema_str}")

    pipeline_options = PipelineOptions(
        beam_args,
        project=args.project,
        region=args.region,
        temp_location=args.temp_location,
        # runner='DataflowRunner',
        runner='DirectRunner',  # Change to 'DataflowRunner' when running on GCP
        save_main_session=True
    )

    with beam.Pipeline(options=pipeline_options) as p:
        # Read all data rows (skip header)
        rows = (
            p
            | 'ReadCSV' >> beam.io.ReadFromText(args.input, skip_header_lines=int(args.skip_header_rows))
            | 'ParseRows' >> beam.ParDo(ParseCSV(), headers, args.delimiter)
        )

        # Write to BigQuery
        rows | 'WriteToBQ' >> beam.io.WriteToBigQuery(
            table=f'{args.project}:{args.dataset}.{args.table_name}',
            schema=schema_str,
            write_disposition=beam.io.BigQueryDisposition.WRITE_TRUNCATE, 
            create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED,
            custom_gcs_temp_location=args.temp_location
        )

if __name__ == '__main__':
    run()
