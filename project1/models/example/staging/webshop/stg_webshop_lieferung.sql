{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_lieferung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_lieferung_h:
        - BESTELLUNGID
        - POSID
        - LIEFERADRID
        - LIEFERDIENSTID

    hd_lieferung_s:
        is_hashdiff: true
        columns:
            - LIEFERDATUM
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}