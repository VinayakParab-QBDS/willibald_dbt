{% macro handle_deleted_records(
    previous_model,
    current_model,
    business_key,
    hashkey_column,
    additional_columns=[]
) %}
{# 
  previous_model: dbt ref for the satellite or any table that holds the hub hash key
  current_model : dbt ref for the latest staging/source snapshot
  business_key  : column name of the natural key in the *current* model
  hashkey_column: name of the hub hash key column present in BOTH previous_model and current_model
  additional_columns: optional list of columns to copy from previous_model
#}

with previous as (
    select
        {{ hashkey_column }}
    {% if additional_columns|length > 0 %},
            {{ additional_columns | join(', ') }}
{% endif %}
    from {{ previous_model }}
),
curr as (
    select
        {{ hashkey_column }},
        {{ business_key }}
    from {{ current_model }}
),
deleted as (
    select
        p.{{ hashkey_column }},
        c.{{ business_key }},
        current_timestamp() as end_date,
        false as is_active
        {% if additional_columns|length > 0 %},
            {{ additional_columns | join(', ') }}
{% endif %}
    from previous p
    left join curr c
      on p.{{ hashkey_column }} = c.{{ hashkey_column }}
    where c.{{ hashkey_column }} is null
)
select *
from deleted
{% endmacro %}
