{{ config(materialized='table') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_businesskeys_from_rs_bestellung'    
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
column_cast:
  GUELTIGBIS: varchar
hashed_columns: 
  hk_bestellung_h:
    - BESTELLUNGID
  hk_position_h:
    - BESTELLUNGID
    - PRODUKTID
  hk_bestellung_kunde_l:                         
    - BESTELLUNGID
    - KUNDEID
  hk_bestellung_produkt_l:
    - BESTELLUNGID
    - PRODUKTID
    - rsrc
  hk_kunde_h:
    - KUNDEID
  hk_produkt_h:
    - PRODUKTID
  hd_bestellung_s:                    
    is_hashdiff: true
    columns:
      - KAUFDATUM
      - MENGE
      - PREIS
      - RABATT        
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }} -- noqa: 
