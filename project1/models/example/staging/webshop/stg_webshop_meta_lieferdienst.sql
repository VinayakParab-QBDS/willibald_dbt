{{ config(materialized='view') }}

{{ handle_business_keys(
     source_relation = (
         add_webshop_metadata('WEBSHOP_LIEFERDIENST')
     ),
     natural_key = 'LIEFERDIENSTID',
     surrogate_columns = ['NAME','STRASSE','HAUSNUMMER','PLZ','ORT','LAND']
) }}
