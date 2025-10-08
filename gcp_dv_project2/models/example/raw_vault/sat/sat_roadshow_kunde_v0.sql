{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'
src_hashdiff: 'hd_kunde_s'
src_payload:
    - KREDITKARTE
    - GUELTIGBIS
    - KKFIRMA
source_model: 'stg_roadshow_kunde_from_rs_bestellung'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 