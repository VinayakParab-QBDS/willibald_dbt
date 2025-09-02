{{ config(materialized='view') }}

{%- set yaml_metadata -%}
sat_v0: 'sat_webshop_wohnort_v0'
hashkey: 'hk_wohnort_h'
hashdiff: 'hd_wohnort_s' 
ma_attribute:
    - phone_type
    - iid
ledts_alias: 'valid_to'
add_is_current_flag: true
{%- endset -%}    

{{ datavault4dbt.ma_sat_v1(yaml_metadata=yaml_metadata) }} -- noqa: 
