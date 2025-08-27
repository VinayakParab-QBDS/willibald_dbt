{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_vereinspartner_kundeidverein_l'
foreign_hashkeys:
    - 'HK_VEREINSPARTNER_H'
    - 'HK_KUNDEVEREIN_H'
source_models:
    - name: stg_roadshow_vereinspartner
      rsrc_static: '*Roadshow*'
    - name: stg_webshop_vereinspartner
      rsrc_static: '*Webshop*'
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}