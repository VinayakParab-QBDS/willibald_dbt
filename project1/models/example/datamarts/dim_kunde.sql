-- models/datamart/dim_product.sql
{{ config(materialized='table') }}

select
    s.*,
    h.hk_kunde_h as kunde_key
from {{ ref('hub_kunde') }} as h
inner join {{ ref('sat_webshop_kunde_v1') }} as s
    on
        h.hk_kunde_h = s.hk_kunde_h
        and s.is_current = 1
