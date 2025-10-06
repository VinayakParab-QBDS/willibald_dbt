{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_position_bestellung_l'
foreign_hashkeys:
    - 'HK_POSITION_H'
    - 'HK_BESTELLUNG_H'
source_models: 
    - name: stg_roadshow_bestellung_from_rs_bestellung
      rsrc_static: '*Roadshow*'
      link_hk: hk_bestellung_produkt_l
    - name: stg_webshop_position
      rsrc_static: '*Webshop*'
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
