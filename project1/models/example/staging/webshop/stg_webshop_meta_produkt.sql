{{ config(materialized='view') }}

{{ flag_duplicates(
     source_relation   = add_webshop_metadata('WEBSHOP_PRODUKT'),  
     key_column        = 'PRODUKTID',                       
     attribute_columns = ['BEZEICHNUNG','UMFANG','TYP','PREIS','PFLANZORT','PFLANZABSTAND'],               
) }}
