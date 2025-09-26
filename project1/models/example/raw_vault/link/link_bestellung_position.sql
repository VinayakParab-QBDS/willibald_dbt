{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_position_bestellung_l'
foreign_hashkeys:
    - 'HK_POSITION_H'
    - 'HK_BESTELLUNG_H'
source_models: stg_webshop_position
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
