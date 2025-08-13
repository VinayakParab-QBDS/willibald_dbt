{% macro add_roadshow_metadata(table_name) %}
    SELECT
        *,
        CURRENT_TIMESTAMP AS edwLoadDate,
        '{{ table_name }}' AS edwRecordSource
    FROM {{ source('roadshow', table_name) }}
{% endmacro %}
