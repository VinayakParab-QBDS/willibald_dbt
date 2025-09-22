{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_lieferadresse_l'
foreign_hashkeys:
    - 'HK_BESTELLUNG_H'
    - 'HK_LIEFERADRESSE_H'
source_models: stg_webshop_bestellung
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }} -- noqa: 
