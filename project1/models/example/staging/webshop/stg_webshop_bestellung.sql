{{ config(materialized='view') }}

WITH src AS (
    {{ add_webshop_metadata('Bestellung') }}
)

{%- set yaml_metadata -%}
source_model: 'src'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_bestellung_h:
        - BESTELLUNGID
        - KUNDEID
    hd_bestellung_s:
        is_hashdiff: true
        columns:
            - KREDITKARTE
            - GUELTIGBIS
            - KKFIRMA
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}