{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_kunde_l'
foreign_hashkeys: 
    - 'hk_bestellung_h'
    - 'hk_kunde_h'
source_models: stg_roadshow_bestellung
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}