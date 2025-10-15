{% macro handle_duplicates(source_relation, key_column, attribute_columns, timestamp_column='edwLoadDate') %}

WITH flagged AS (
    SELECT *,
        COUNT(*) OVER (PARTITION BY {{ key_column }}) AS cnt,
        COUNT(DISTINCT {{ attribute_columns | join(" || ") }}) 
            OVER (PARTITION BY {{ key_column }}) AS distinct_attr_count,
        ROW_NUMBER() OVER (PARTITION BY {{ key_column }} ORDER BY {{ timestamp_column }} DESC) AS rn
    FROM ({{ source_relation }})
),

cleaned AS (
    SELECT *,
        CASE
            WHEN cnt > 1 AND distinct_attr_count = 1 THEN 'actual_duplicate'
            WHEN cnt > 1 AND distinct_attr_count > 1 THEN 'contradictory_duplicate'
            ELSE 'unique'
        END AS duplicate_type
    FROM flagged
)

SELECT *
FROM cleaned

{% endmacro %}
