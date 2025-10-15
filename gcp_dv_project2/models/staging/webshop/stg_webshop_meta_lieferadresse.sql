{{ config(materialized='view') }}

{{ handle_orphan_records(
     source_relation   = add_webshop_metadata('Webshop_lieferadresse'),  
     fk_column        = 'KUNDEID',
     reference_relation = add_webshop_metadata('Webshop_Kunde'),                       
     reference_key = 'KUNDEID'             
) }}
