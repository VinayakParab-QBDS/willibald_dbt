{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_wohnort_h'
business_keys: 
      - KUNDEID
      - VON
source_models: stg_webshop_wohnort
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
