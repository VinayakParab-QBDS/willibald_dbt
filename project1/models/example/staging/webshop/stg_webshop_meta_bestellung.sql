{{ config(materialized='view') }}

{{ combine_webshop_bestellung_metadata('WEBSHOP_BESTELLUNG') }}