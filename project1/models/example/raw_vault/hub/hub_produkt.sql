{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_produkt_h'
business_keys: 
    - PRODUKTID
source_models:
    - name: stg_roadshow_produkt_from_rs_bestellung
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_produkt
      bk_columns:
        - PRODUKTID
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
