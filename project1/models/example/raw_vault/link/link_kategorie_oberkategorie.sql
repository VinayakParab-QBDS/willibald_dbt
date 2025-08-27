{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_kategorie_oberkategorie_l'
foreign_hashkeys:
    - 'HK_KATEGORIE_H'
    - 'HK_OBERKATEGORIE_H'
source_models: stg_webshop_kategorie
{%- endset -%}    

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}