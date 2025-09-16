{% macro handle_missing_business_keys(source_relation,
                              natural_key,
                              surrogate_columns) %}

    (
        select
            *,
            case
                when {{ natural_key }} is not null
                     then cast({{ natural_key }} as string)
                else
                     {{ datavault4dbt.hash(columns = surrogate_columns) }}
            end as business_key_final,
            case when {{ natural_key }} is null then true else false end as IS_GENERATED_KEY
        from ({{ source_relation }})
    )
{% endmacro %}
