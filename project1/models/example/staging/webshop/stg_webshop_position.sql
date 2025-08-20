{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_position'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns:
    hk_position_h:
        - BESTELLUNGID
        - POSID
    hk_position_bestellung_l:
        - POSID
        - BESTELLUNGID
    hk_position_produkt_l:
        - BESTELLUNGID
        - POSID
        - PRODUKTID
    hk_position_spezlieferadr_l:
        - BESTELLUNGID
        - POSID
        - SPEZLIEFERADRID
    hd_position_s:
        is_hashdiff: true
        columns:
            - MENGE
            - PREIS
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}