{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_wohnort'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_wohnort_h:
        - KUNDEID
        - VON
    hk_wohnort_kunde_l:
        - KUNDEID
    hd_wohnort_s:
        is_hashdiff: true
        columns:
            - BIS
            - STRASSE
            - HAUSNUMMER
            - ADRESSZUSATZ
            - PLZ
            - ORT
            - LAND
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }} -- noqa: 
