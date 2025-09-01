{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_lieferdienst_h'
business_keys: 
    - LIEFERDIENSTID
source_models: stg_webshop_lieferdienst
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
