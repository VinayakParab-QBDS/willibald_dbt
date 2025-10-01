with
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
    0 as hk_position_produkt_l,
    b.hk_bestellung_h,
    l.hk_produkt_h,
    lk.hk_kunde_h,
    0 as hk_position_h,
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
