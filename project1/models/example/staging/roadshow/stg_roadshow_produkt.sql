{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_account'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_account_h:
        - account_number
        - account_key
    hd_account_s:
        is_hashdiff: true
        columns:
            - name
            - address
            - phone
            - email
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}