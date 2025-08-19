{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_kunde'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_kunde_h:
        - KUNDEID
    hk_vereinspartner_h:
        - VEREINSPARTNERID
    hd_kunde_s:
        is_hashdiff: true
        columns:
            - VORNAME
            - NAME
            - GESCHLECHT
            - GEBURTSDATUM
            - TELEFON
            - MOBIL
            - EMAIL
            - KREDITKARTE
            - GUELTIGBIS
            - KKFIRMA
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}