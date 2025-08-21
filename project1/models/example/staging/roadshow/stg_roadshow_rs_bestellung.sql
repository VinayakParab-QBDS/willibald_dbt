{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_rs_bestellung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_rs_bestellung_h:
        - BESTELLUNGID
    hd_rs_bestellung_s:
        is_hashdiff: true
        columns:
            - KUNDEID
            - VEREINSPARTNERID
            - KAUFDATUM
            - KREDITKARTE
            - GUELTIGBIS
            - KKFIRMA
            - MENGE
            - PREIS
            - RABATT
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}