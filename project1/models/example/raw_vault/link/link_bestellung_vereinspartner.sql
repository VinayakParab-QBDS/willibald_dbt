{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_vereinspartner_l'
foreign_hashkeys:
    - 'HK_BESTELLUNG_H'
    - 'HK_VEREINSPARTNER_H'
source_models: stg_webshop_bestellung
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
