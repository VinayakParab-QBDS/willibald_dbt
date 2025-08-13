{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_kategorie'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_kategorie_h:
        - KATID
        - OBERKATID
    hd_kategorie_s:
        is_hashdiff: true
        columns:
            - NAME
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}