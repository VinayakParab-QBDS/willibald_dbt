{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_produkt_kategorie_l'
foreign_hashkeys:
    - 'HK_PRODUKT_H'
    - 'HK_KATEGORIE_H'
source_models: stg_webshop_produkt
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}