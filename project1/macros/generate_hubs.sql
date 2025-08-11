{% macro generate_all_hubs(hub_configs) %}
{% for hub in hub_configs %}
    {{ datavault4dbt.hub(
        source_model = hub.source_model,
        src_pk = hub.entity ~ '_hk',
        src_nk = hub.business_keys,
        load_date = 'load_date',
        record_source = "'" ~ hub.record_source ~ "'"
    ) }}
{% endfor %}
{% endmacro %}
