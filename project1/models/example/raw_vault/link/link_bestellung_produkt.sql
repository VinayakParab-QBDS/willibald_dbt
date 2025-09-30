{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_produkt_l'
foreign_hashkeys:
    - 'HK_BESTELLUNG_H'
    - 'HK_PRODUKT_H'
source_models: stg_roadshow_bestellung_from_rs_bestellung
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
