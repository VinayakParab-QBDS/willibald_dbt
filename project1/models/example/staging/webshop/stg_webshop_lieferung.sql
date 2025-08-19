{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_lieferung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_bestellung_pos_h:
        - BESTELLUNGID
        - POSID
    hk_lieferadresse_h:
        - LIEFERADRID
    hk_lieferdienst_h
        - LIEFERDIENSTID
    hk_lieferung_l:
        - BESTELLUNGID
        - POSID
        - LIEFERADRID
        - LIEFERDIENSTID
    hd_lieferung_s:
        is_hashdiff: true
        columns:
            - LIEFERDATUM
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}