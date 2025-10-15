{% macro add_webshop_metadata(table_name) %}
    SELECT
        *,
        CURRENT_TIMESTAMP AS edwLoadDate,
        '{{ table_name }}' AS edwRecordSource
    FROM {{ source('raw_data', table_name) }}
{% endmacro %}
