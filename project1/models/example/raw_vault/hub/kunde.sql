{{ config(materialized='incremental') }}

{% set hub_configs = [
  {
    "entity": "kunde",
    "source_model": "stg_customer",
    "business_keys": ["kunde_id"],
    "record_source": "Webshop"
  }
] %}

{{ generate_all_hubs(hub_configs) }}
