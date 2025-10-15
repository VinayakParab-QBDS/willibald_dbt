{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_businesskeys_from_rs_bestellung'    
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_produkt_h:
        - PRODUKTID
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }} -- noqa: 
