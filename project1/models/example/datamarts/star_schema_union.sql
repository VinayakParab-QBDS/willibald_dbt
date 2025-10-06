{{ config(materialized='incremental') }}

-- This table combines data from multiple hubs, links,
--and satellites to create a fact table for webshop and roadshow orders.
--Webshop orders
with
-- 1 Latest POSITION satellite row (gives qty, price)
position_latest as (
    select
        hk_position_h,
        menge,
        preis,
        rsrc
    from {{ ref('sat_webshop_position_v1') }}
    where is_current = 1
),

-- 2 Latest BESTELLUNG satellite row (gives discount & order date)
bestellung_latest_webshop as (
    select
        hk_bestellung_h,
        rabatt,
        bestelldatum,
        rsrc
    from {{ ref('sat_webshop_bestellung_v1') }}
    where is_current = 1
),

-- 3 Latest ROADSHOW BESTELLUNG satellite row (gives qty, price, discount, order date)
bestellung_latest_roadshow as (
    select
        hk_bestellung_h,
        kaufdatum as bestelldatum,
        menge,
        preis,
        rabatt,
        rsrc
    from {{ ref('sat_roadshow_bestellung_v1') }}
    where is_current = 1
)

select
    b.hk_bestellung_h,
    l.hk_produkt_h,
    lk.hk_kunde_h,
    bl.bestelldatum,
    p.preis,
    p.menge,
    bl.rabatt,
    l.rsrc,
    -- revenue = qty * price – discount
    (p.menge * p.preis) - coalesce(bl.rabatt, 0) as revenue
from {{ ref('link_position_produkt') }} as l
inner join position_latest as p
    on
        l.hk_position_h = p.hk_position_h
inner join {{ ref('link_bestellung_position') }} as lp
    on
        p.hk_position_h = lp.hk_position_h
inner join {{ ref('hub_bestellung') }} as b
    on
        lp.hk_bestellung_h = b.hk_bestellung_h
        and (b.bestellungid != '(unknown)' and b.bestellungid != '(error)')
inner join bestellung_latest_webshop as bl
    on
        b.hk_bestellung_h = bl.hk_bestellung_h
inner join {{ ref('link_bestellung_kunde') }} as lk
    on
        b.hk_bestellung_h = lk.hk_bestellung_h

union distinct

select
    b.hk_bestellung_h,
    l.hk_produkt_h,
    lk.hk_kunde_h,
    p.bestelldatum,
    p.preis,
    p.menge,
    p.rabatt,
    l.rsrc,
    -- revenue = qty * price – discount
    (p.menge * p.preis) - coalesce(p.rabatt, 0) as revenue
from {{ ref('link_bestellung_produkt') }} as l
inner join bestellung_latest_roadshow as p
    on
        l.hk_bestellung_h = p.hk_bestellung_h
inner join {{ ref('hub_bestellung') }} as b
    on
        p.hk_bestellung_h = b.hk_bestellung_h
        and (b.bestellungid != '(unknown)' and b.bestellungid != '(error)')
inner join {{ ref('link_bestellung_kunde') }} as lk
    on
        b.hk_bestellung_h = lk.hk_bestellung_h
