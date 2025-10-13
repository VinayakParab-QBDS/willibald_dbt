{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_bestellung_h'
business_keys: 
    - BESTELLUNGID
source_models: stg_roadshow_bestellung_from_rs_bestellung
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
