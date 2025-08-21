{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_wohnort_h'
business_keys: 
      - KUNDEID
      - VON
source_models:
    - name: stg_roadshow_wohnort
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_wohnort
      bk_columns:
        - KUNDEID
        - VON
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}