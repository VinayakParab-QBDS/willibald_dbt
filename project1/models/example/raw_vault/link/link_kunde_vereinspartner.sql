{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_kunde_vereinspartner_l'
foreign_hashkeys:
    - 'HK_KUNDE_H'
    - 'HK_VEREINSPARTNER_H'
source_models:
    - name: stg_roadshow_kunde
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_kunde
      rsrc_static: '*Webshop*'
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}