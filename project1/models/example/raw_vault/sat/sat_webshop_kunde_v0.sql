{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'
src_hashdiff: 'hd_kunde_s'
src_payload:
    - VORNAME
    - NAME
    - GESCHLECHT
    - GEBURTSDATUM
    - TELEFON
    - MOBIL
    - EMAIL
    - KREDITKARTE
    - GUELTIGBIS
    - KKFIRMA
source_model: 'stg_webshop_kunde'

hard_delete: true
record_end_date_column: 'edwEndDate'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }} -- noqa: 
