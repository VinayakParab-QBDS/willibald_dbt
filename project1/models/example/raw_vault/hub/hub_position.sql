{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_position_h'
business_keys: 
    - BESTELLUNGID
    - POSID
source_models: 
    - name: stg_webshop_position
      rsrc_static: '*Webshop*'
    - name: stg_roadshow_bestellung_from_rs_bestellung
      rsrc_static: '*Roadshow*'
      bk_columns:
        - BESTELLUNGID
        - PRODUKTID     	      
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }} -- noqa: 
