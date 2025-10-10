--Docker Commands------------------------------------

docker build -t europe-west3-docker.pkg.dev/velvety-glazing-472909-h6/dataflow-images/beam-gcs-bq:latest .

docker run europe-west3-docker.pkg.dev/velvety-glazing-472909-h6/dataflow-images/beam-gcs-bq --input gs://willibald_bucket/raw/RS_Bestellung_Tag1.csv --table_name RS_Bestellung_Tag1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west3

--With my own service account
docker run -v C:/Users/Vinayak-SitaramParab/keys/dataflow_bq_access.json:/opt/dataflow_bq_access.json -e GOOGLE_APPLICATION_CREDENTIALS="/opt/dataflow_bq_access.json" europe-west3-docker.pkg.dev/velvety-glazing-472909-h6/dataflow-images/beam-gcs-bq --input gs://willibald_bucket/raw/RS_Bestellung_Tag_1.csv --table_name RS_Bestellung_Tag_1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west3

--With Default Service Account
docker run -v C:/Users/Vinayak-SitaramParab/keys/bq_service_account.json:/opt/bq_service_account.json -e GOOGLE_APPLICATION_CREDENTIALS="/opt/bq_service_account.json" europe-west3-docker.pkg.dev/velvety-glazing-472909-h6/dataflow-images/beam-gcs-bq --input gs://willibald_bucket/raw/RS_Bestellung_Tag_1.csv --table_name RS_Bestellung_Tag_1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west3



--python Commands-------------------------------------


python gcp_to_bigq_pipeline.py --input gs://willibald_bucket/raw/RS_Bestellung_Tag_1.csv --table_name RS_Bestellung_Tag_1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input gs://willibald_bucket/raw/RS_Bestellung_Tag_1.csv --table_name RS_Bestellung_Tag_1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west4 --experiments=use_unsupported_python_version

--Working Command--  only replace the table names

python gcp_to_bigq_pipeline.py --input gs://willibald_bucket/raw/RS_Bestellung_Tag_1.csv --table_name RS_Bestellung_Tag_1 --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1


--Service Account

gcloud iam service-accounts add-iam-policy-binding dataflow-bq-access@velvety-glazing-472909-h6.iam.gserviceaccount.com --member="user:vinayakparab.qbeyond@gmail.com" --role="roles/iam.serviceAccountUser"

--Anaconda Commands---------------------------------------

conda create --name willibald_gcp python=3.8

conda activate willibald_gcp


