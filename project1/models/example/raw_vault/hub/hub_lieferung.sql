{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_lieferung_nl'
business_keys: 
        - BESTELLUNGID
        - POSID
        - LIEFERADRID
        - LIEFERDIENSTID
source_models: stg_webshop_lieferung
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
