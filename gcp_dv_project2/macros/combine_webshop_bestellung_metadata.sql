{% macro combine_webshop_bestellung_metadata(table_name) %}
    SELECT
        CAST(BESTELLUNGID AS VARCHAR) AS BESTELLUNGID,
        KUNDEID,
        ALLGLIEFERADRID,
        BESTELLDATUM,
        WUNSCHDATUM,
        RABATT,
        CURRENT_TIMESTAMP AS edwLoadDate,
        '{{ table_name }}' AS edwRecordSource
    FROM {{ source('raw_data', table_name) }}
{% endmacro %}
