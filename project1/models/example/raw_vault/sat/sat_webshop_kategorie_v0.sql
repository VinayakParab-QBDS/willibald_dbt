{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kategorie_h'
src_hashdiff: 'hd_kategorie_s'
src_payload:
    - NAME
source_model: 'stg_webshop_kategorie'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 
