{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_rs_bestellung_h'
business_keys: 
        - BESTELLUNGID
source_models: stg_roadshow_rs_bestellung
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
