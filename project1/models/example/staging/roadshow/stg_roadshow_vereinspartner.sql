{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_roadshow_meta_vereinspartner'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_vereinspartner_h:
        - VEREINSPARTNERID
    hd_vereinspartner_s:
        is_hashdiff: true
        columns:
            - KUNDEIDVEREIN
            - RABATT1
            - RABATT2
            - RABATT3

{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}