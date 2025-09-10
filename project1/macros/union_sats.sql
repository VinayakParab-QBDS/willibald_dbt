{% macro union_sats(sats, hk_col, hd_col, payload_cols) %}
with unioned as (
  {% for sat in sats %}
    select
      {{ hk_col }} as hk,
      {{ hd_col }} as hd,
      {{ payload_cols | join(', ') }},
      ldts,
      rsrc
    from {{ ref(sat) }}
{% if not loop.last %} union all {% endif %}
{% endfor %}
),

sequenced as (
  select
    hk,
    hd,
    {{ payload_cols | join(', ') }},
    ldts,
    rsrc,
    lead(ldts) over (partition by hk order by ldts) as loadenddate,
    case when lead(ldts) over (partition by hk order by ldts) is null 
         then true else false end as is_current
  from unioned
)

select * from sequenced
{% endmacro %}
