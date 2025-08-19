{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_bestellung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns:
  hk_bestellung_h:                    
    - BESTELLUNGID
  hk_kunde_h:                         
    - KUNDEID
  hk_lieferadresse_h:                 
    - ALLGLIEFERADRID
  hd_bestellung_s:                    
    is_hashdiff: true
    columns:
      - BESTELLDATUM
      - WUNSCHDATUM
      - RABATT
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}