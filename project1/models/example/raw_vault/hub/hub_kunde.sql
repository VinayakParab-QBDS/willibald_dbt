{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_kunde_h'
business_keys: 
    - KUNDEID
source_models:
    - name: stg_roadshow_kunde
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_kunde
      bk_columns:
        - KUNDEID
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
