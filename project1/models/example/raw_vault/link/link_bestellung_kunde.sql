{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_kunde_l'
foreign_hashkeys:
    - 'hk_bestellung_h'
    - 'hk_kunde_h'
source_models:
    - name: stg_roadshow_bestellung
      rsrc_static: '*Roadshow*'
      fk_columns:
          - BESTELLUNGID
          - KUNDEID
    - name: stg_webshop_bestellung
      rsrc_static: '*Webshop*'
      link_hk: 'hk_bestellung_kunde_l'
      fk_columns: 
          - BESTELLUNGID
          - KUNDEID
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}