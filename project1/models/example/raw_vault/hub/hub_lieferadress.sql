{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_liefer_h'
business_keys: 
    - LIEFERADRID
source_models:
    - name: stg_roadshow_lieferadresse
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_lieferadresse
      bk_columns:
        - LIEFERADRID
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}