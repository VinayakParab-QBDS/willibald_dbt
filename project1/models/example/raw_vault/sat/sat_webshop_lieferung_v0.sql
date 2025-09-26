{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_lieferung_h'
src_hashdiff: 'hd_lieferung_s'
src_payload:
    - LIEFERDATUM
source_model: 'stg_webshop_lieferung'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 