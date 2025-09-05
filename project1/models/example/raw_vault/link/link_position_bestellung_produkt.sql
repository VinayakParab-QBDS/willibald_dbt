{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_lieferung_position_l'
foreign_hashkeys:
    - 'HK_BESTELLUNG_H'
    - 'hk_position_h'
source_models: stg_webshop_lieferung
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
