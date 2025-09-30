{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_position_h'
column_cast:
  BESTELLUNGID: varchar
  POSID: varchar
business_keys: 
      - BESTELLUNGID
      - POSID
source_models: 
    - name: stg_webshop_position
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
