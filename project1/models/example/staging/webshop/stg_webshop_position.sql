{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_position'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns:
    hk_bestellung_h:
        - BESTELLUNGID
    hk_bestellung_pos_h:
        - BESTELLUNGID
        - POSID
    hk_produkt_h:
        - PRODUKTID
    hk_spezlieferadr_h:
        - SPEZLIEFERADRID
    hk_position_l:
        - BESTELLUNGID
        - POSID
        - PRODUKTID
        - SPEZLIEFERADRID
    hd_position_s:
        is_hashdiff: true
        columns:
            - MENGE
            - PREIS
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}