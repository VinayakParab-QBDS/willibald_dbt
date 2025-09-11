{{ config(materialized='view') }}

{{ add_webshop_metadata('WEBSHOP_PRODUKT') }}

{{ handle_business_keys(source_relation=ref('WEBSHOP_LIEFERDIENST'),
                               natural_key='LIEFERDIENSTID',
                               surrogate_columns=['NAME', 'STRASSE','HAUSNUMMER','PLZ','ORT','LAND']) }}
