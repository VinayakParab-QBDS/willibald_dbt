{% macro handle_orphan_records(source_relation, fk_column, reference_relation, reference_key) %}
select
    src.*,
    case
        when ref_exists.ref_key is null then true
        else false
    end as is_missing_fk
from ({{ source_relation }}) as src
left join (
    select {{ reference_key }} as ref_key
    from ({{ reference_relation }})
) as ref_exists
on src.{{ fk_column }} = ref_exists.ref_key

{% endmacro %}
