{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_position_h'
business_keys: 
      - BESTELLUNGID
      - POSID
source_models: stg_webshop_position
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}