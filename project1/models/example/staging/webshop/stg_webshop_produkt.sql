{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_produkt'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_produkt_h:
        - PRODUKTID
    hk_kategorie_h:
        - KATID
    hk_produkt_kategorie_l:
        - PRODUKTID
        - KATID
    hd_produkt_s:
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