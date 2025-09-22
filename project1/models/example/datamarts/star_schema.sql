{{ config(materialized='incremental') }}

with
-- 1️⃣ Latest POSITION satellite row (gives qty, price, and BESTELLUNGID)
position_latest as (
    select
        hk_position_h,
        menge,
        preis,
        bestellungid,
        row_number() over (
            partition by hk_position_h
            order by ldts desc
        ) as rn
    from {{ ref('sat_webshop_position_v1') }}
),

-- 2️⃣ Latest BESTELLUNG satellite row (discount & order date)
bestellung_latest as (
    select
        hk_bestellung_h,
        rabatt,
        bestelldatum,
        row_number() over (
            partition by hk_bestellung_h
            order by ldts desc
        ) as rn
    from {{ ref('sat_webshop_bestellung_v1') }}
)

select
    l.hk_position_produkt_l,
    b.hk_bestellung_h,
    l.hk_produkt_h,
    bl.bestelldatum,
    p.preis,
    p.menge,
    bl.rabatt,
    -- revenue = qty * price – discount
    (p.menge * p.preis) - coalesce(bl.rabatt, 0) as revenue
from {{ ref('link_position_produkt') }} as l
inner join position_latest as p
    on
        l.hk_position_h = p.hk_position_h
        and p.rn = 1
-- 🔑 join Hub_Bestellung via BESTELLUNGID exposed by SAT_POSITION
inner join {{ ref('hub_bestellung') }} as b
    on
        p.bestellungid = b.bestellungid
        and (b.bestellungid != '(unknown)' and b.bestellungid != '(error)')
inner join bestellung_latest as bl
    on
        b.hk_bestellung_h = bl.hk_bestellung_h
        and bl.rn = 1
