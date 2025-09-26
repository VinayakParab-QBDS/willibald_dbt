{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_businesskeys_from_rs_bestellung'    
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_kunde_h:
        - KUNDEID
        - rsrc
    hd_kunde_s:
        is_hashdiff: true
        columns:
          - KREDITKARTE
          - GUELTIGBIS
          - KKFIRMA
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }} -- noqa: 
