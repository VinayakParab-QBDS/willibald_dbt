{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_businesskeys_from_rs_bestellung'    
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
column_cast:
  GUELTIGBIS: varchar
hashed_columns: 
  hk_bestellung_h:
    - BESTELLUNGID
    - rsrc
  hd_bestellung_s:                    
    is_hashdiff: true
    columns:
      - KAUFDATUM
      - MENGE
      - PREIS
      - RABATT        
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }} -- noqa: 
