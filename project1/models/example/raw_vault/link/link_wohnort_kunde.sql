{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_wohnort_kunde_l'
foreign_hashkeys:
    - 'HK_WOHNORT_H'              
source_models: stg_webshop_wohnort                
{%- endset -%}

{{ datavault4dbt.link(yaml_metadata=yaml_metadata) }}
