{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_vereinspartner_h'
business_keys: 
    - VEREINSPARTNERID
source_models:
    - name: stg_roadshow_vereinspartner
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_vereinspartner
      bk_columns:
        - VEREINSPARTNERID
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
