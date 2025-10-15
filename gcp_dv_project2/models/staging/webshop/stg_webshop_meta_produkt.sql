{{ config(materialized='view') }}

{{ handle_duplicates(
     source_relation   = add_webshop_metadata('Webshop_produkt'),  
     key_column        = 'PRODUKTID',                       
     attribute_columns = ['BEZEICHNUNG','UMFANG','TYP','PREIS','PFLANZORT','PFLANZABSTAND'],               
) }}
