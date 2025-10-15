{{ config(materialized='view') }} -- noqa: 

{%- set yaml_metadata -%}
source_model: 'stg_webshop_meta_kategorie'
ldts: 'edwLoadDate'
rsrc: 'edwRecordSource'
hashed_columns: 
    hk_kategorie_h:
        - KATID
    hk_oberkategorie_h:
        - OBERKATID
    hk_kategorie_oberkategorie_l:
        - KATID
        - OBERKATID        
    hd_kategorie_s:
        is_hashdiff: true
        columns:
            - NAME
{%- endset -%}

{{ datavault4dbt.stage(yaml_metadata=yaml_metadata) }}
