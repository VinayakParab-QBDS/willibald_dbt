{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "(select *, current_timestamp as edwLoadDate, 'raw.account' as edwRecordSource from {{ source('webshop', 'Bestellung') }})"
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_account_h:
        - BESTELLUNGID
        - KUNDEID
    hd_account_s:
        is_hashdiff: true
        columns:
            - name
            - address
            - phone
            - email
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}