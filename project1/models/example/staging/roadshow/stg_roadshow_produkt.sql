{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_produkt'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_bestellung_h:
        - PRODUKTID
    hd_bestellung_s:
        is_hashdiff: true
        columns:
            - BEZEICHNUNG
            - UMFANG
            - TYP
            - PREIS
            - PFLANZORT
            - PFLANZABSTAND

{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}