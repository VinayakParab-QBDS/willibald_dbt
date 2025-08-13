{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'bestellung_kunde_hk'
business_keys: 
    - BESTELLUNGID
    - KUNDEID
source_models:
    - name: stg_roadshow_bestellung
      rsrc_static: '*ROADSHOW*'
    - name: stg_webshop_bestellung
      hk_column: 'bestellung_kunde_hk'
      bk_columns:
          - BESTELLUNGID
          - KUNDEID
      rsrc_static: '*WEBSHOP*'
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}
