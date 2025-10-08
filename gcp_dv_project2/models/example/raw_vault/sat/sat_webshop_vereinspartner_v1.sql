{{ config(materialized='view') }}

{%- set yaml_metadata -%}
sat_v0: 'sat_webshop_vereinspartner_v0'
hashkey: 'hk_vereinspartner_h'
hashdiff: 'hd_vereinspartner_s'   
ledts_alias: 'loadenddate'
add_is_current_flag: true
{%- endset -%}    

{{ datavault4dbt.sat_v1(yaml_metadata=yaml_metadata) }} -- noqa: 