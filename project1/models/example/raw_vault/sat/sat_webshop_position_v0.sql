{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_position_h'
src_hashdiff: 'hd_position_s'
src_payload:
    - MENGE
    - PREIS
source_model: 'stg_webshop_position'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 