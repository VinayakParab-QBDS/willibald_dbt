{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_liefer_h'
src_hashdiff: 'hd_liefer_s'
src_payload:
    - STRASSE
    - HAUSNUMMER
    - ADRESSZUSATZ
    - PLZ
    - ORT
    - LAND
source_model: 'stg_webshop_lieferadresse'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 
