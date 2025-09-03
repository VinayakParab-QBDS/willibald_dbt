{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_wohnort'
parent_hashkey: 'hk_wohnort_h'
src_hashdiff: 'hd_wohnort_s'
src_ma_key: 'VON'
src_payload: 
    - BIS
    - STRASSE
    - HAUSNUMMER
    - ADRESSZUSATZ
    - PLZ
    - ORT
    - LAND
{%- endset -%}

{{ datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata) }} -- noqa:
