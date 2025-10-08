{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_vereinspartner'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_vereinspartner_h:
        - VEREINSPARTNERID
    hk_kundeverein_h:
        - KUNDEIDVEREIN
    hk_vereinspartner_kundeidverein_l:
        - VEREINSPARTNERID
        - KUNDEIDVEREIN
    hd_vereinspartner_s:
        is_hashdiff: true
        columns:
            - RABATT1
            - RABATT2
            - RABATT3

{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
