{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_rs_bestellung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_rs_bestellung_h:
        - BESTELLUNGID
        - KUNDEID
    hd_rs_bestellung_s:
        is_hashdiff: true
        columns:
            - KREDITKARTE
            - GUELTIGBIS
            - KKFIRMA
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}