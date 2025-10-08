{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_lieferung_nl'
foreign_hashkeys: 
    - 'hk_bestellung_h'
    - 'hk_position_h'
    - 'hk_lieferadresse_h'
    - 'hk_lieferdienst_h'
payload:
    - LIEFERDATUM
source_models: stg_webshop_lieferung
{%- endset -%}    

{{ datavault4dbt.nh_link(yaml_metadata=yaml_metadata) }}
