{{ config(materialized='incremental') }}

{{ handle_deleted_records(
     previous_model=ref('sat_webshop_bestellung_v1'),
     current_model=ref('stg_webshop_bestellung'),
     business_key='BESTELLUNGID',
     hashkey_column='hk_bestellung_h'
) }}