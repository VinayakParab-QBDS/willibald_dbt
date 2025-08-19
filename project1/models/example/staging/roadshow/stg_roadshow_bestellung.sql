{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_bestellung'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns:
  hk_bestellung_h:            
    - BESTELLUNGID
  hk_kunde_h:                 
    - KUNDEID
  hk_vereinspartner_h:        
    - VEREINSPARTNERID
  hk_produkt_h:               
    - PRODUKTID
  hk_bestellung_kunde_l:      
    - BESTELLUNGID
    - KUNDEID
  hk_bestellung_vereinspartner_l:   
    - BESTELLUNGID
    - VEREINSPARTNERID
  hk_bestellung_produkt_l:    
    - BESTELLUNGID
    - PRODUKTID
  hd_bestellung_s:            
    is_hashdiff: true
    columns:
      - KAUFDATUM
      - KREDITKARTE
      - GUELTIGBIS
      - KKFIRMA
      - MENGE
      - PREIS
      - RABATT
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}