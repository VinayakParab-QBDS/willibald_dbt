-- models/datamart/dim_product.sql
{{ config(materialized='table') }}

select
    s.*,
    h.hk_produkt_h as produkt_key
from {{ ref('hub_produkt') }} as h
inner join {{ ref('sat_webshop_produkt_v1') }} as s
    on
        h.hk_produkt_h = s.hk_produkt_h
        and s.is_current = 1
