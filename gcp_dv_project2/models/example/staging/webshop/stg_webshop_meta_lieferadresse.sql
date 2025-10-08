{{ config(materialized='view') }}

{{ handle_orphan_records(
     source_relation   = add_webshop_metadata('WEBSHOP_LIEFERADRESSE'),  
     fk_column        = 'KUNDEID',
     reference_relation = add_webshop_metadata('WEBSHOP_KUNDE'),                       
     reference_key = 'KUNDEID'             
) }}
