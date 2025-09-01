{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_liefer_h'
business_keys: 
        - LIEFERADRID
source_models: stg_webshop_lieferadresse
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
