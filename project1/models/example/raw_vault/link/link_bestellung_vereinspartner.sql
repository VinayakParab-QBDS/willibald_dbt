{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_vereinspartner_l'
foreign_hashkeys:
    - 'HK_BESTELLUNG_H'
    - 'HK_VEREINSPARTNER_H'
source_models:
    - name: stg_roadshow_bestellung
      rsrc_static: '*Roadshow*'
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}