{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_bestellung_h'
column_cast:
  BESTELLUNGID: VARCHAR(128)
business_keys: 
    - BESTELLUNGID
source_models:
    - name: stg_roadshow_bestellung_from_rs_bestellung
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_bestellung
      bk_columns:
        - BESTELLUNGID
      rsrc_static: '*Webshop*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
