{{ config(
    materialized='table'
) }}

WITH source_data AS (
    SELECT *
    FROM {{ source('raw_data', 'RS_Bestellung_Tag_1') }}
)

SELECT *
FROM source_data
