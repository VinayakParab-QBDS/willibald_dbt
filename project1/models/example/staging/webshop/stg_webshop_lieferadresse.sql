{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_lieferadresse'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_liefer_h:
        - LIEFERADRID
    hk_kunde_h:
        - KUNDEID
    hk_liefer_kunde_l:
        - LIEFERADRID
        - KUNDEID        
    hd_liefer_s:
        is_hashdiff: true
        columns:
            - STRASSE
            - HAUSNUMMER
            - ADRESSZUSATZ
            - PLZ
            - ORT
            - LAND
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}