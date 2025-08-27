{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_bestellung_h'
src_hashdiff: 'hd_bestellung_s'
src_payload:
    - KAUFDATUM
    - KREDITKARTE
    - GUELTIGBIS
    - KKFIRMA
    - MENGE
    - PREIS
    - RABATT
source_model: 'stg_roadshow_bestellung'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}