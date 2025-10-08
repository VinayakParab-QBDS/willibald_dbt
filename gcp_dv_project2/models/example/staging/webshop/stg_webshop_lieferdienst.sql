{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_lieferdienst'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_lieferdienst_h:
        - LIEFERDIENSTID
    hd_lieferdienst_s:
        is_hashdiff: true
        columns:
            - NAME
            - TELEFON
            - FAX
            - EMAIL
            - STRASSE
            - HAUSNUMMER
            - PLZ
            - ORT
            - LAND
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
