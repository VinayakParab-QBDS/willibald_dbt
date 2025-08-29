{{ config(materialized='view') }}

{%- set yaml_metadata -%}
sat_v0: 'sat_webshop_kategorie_v0'
hashkey: 'hk_kategorie_h'
hashdiff: 'hd_kategorie_s'   
ledts_alias: 'loadenddate'
add_is_current_flag: true
{%- endset -%}    

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }} -- noqa: 
