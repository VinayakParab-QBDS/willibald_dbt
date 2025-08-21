{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_bestellung_h'
business_keys: 
    - account_key
    - account_number
source_models: stage_account
{%- endset -%}

{{ datavault4dbt.hub(yaml_metadata=yaml_metadata) }}