{{ config(materialized='view') }} -- noqa: 

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_lieferung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_lieferung_h:
        - BESTELLUNGID
        - POSID
        - LIEFERADRID
        - LIEFERDIENSTID
    hk_bestellung_h:
        - BESTELLUNGID
    hk_position_h:
        - POSID
    hk_lieferung_position_l:
        - BESTELLUNGID
        - POSID
    hk_lieferung_adresse_l:
        - LIEFERADRID
    hk_lieferung_dienst_l:
        - LIEFERDIENSTID
    hd_lieferung_s:
        is_hashdiff: true
        columns:
            - LIEFERDATUM
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
