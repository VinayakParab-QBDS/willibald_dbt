@echo off
call "C:\ProgramData\miniconda3\Scripts\activate.bat"
call conda activate willibald_gcp 

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_Lieferung.csv" --table_name Webshop_Lieferung --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_Kunde.csv" --table_name Webshop_Kunde --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_lieferadresse.csv" --table_name Webshop_lieferadresse --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_lieferdienst.csv" --table_name Webshop_lieferdienst --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_position.csv" --table_name Webshop_position --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_produkt.csv" --table_name Webshop_produkt --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_produktkategorie.csv" --table_name Webshop_produktkategorie --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_vereinspartner.csv" --table_name Webshop_vereinspartner --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

python gcp_to_bigq_pipeline.py --input "gs://willibald_bucket/raw/Webshop/Testdaten Period 1/Webshop_wohnort.csv" --table_name Webshop_wohnort --dataset raw --project velvety-glazing-472909-h6 --temp_location gs://willibald_bucket/tmp --region europe-west1

echo All scripts finished!
pause
