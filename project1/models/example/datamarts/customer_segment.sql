{{ config(materialized='incremental') }}

With first_order As (
    Select
        b.hk_kunde_h,
        min(bestelldatum) As first_order_date
    From {{ ref('sat_webshop_bestellung_v1') }} As a
    Inner Join {{ ref('link_bestellung_kunde') }} As b
        On a.hk_bestellung_h = b.hk_bestellung_h
    Group By b.hk_kunde_h
)
,

orders As (
    Select
        b.hk_kunde_h,
        a.hk_bestellung_h,
        a.bestelldatum
    From sat_webshop_bestellung_v1 As a
    Inner Join {{ ref('link_bestellung_kunde') }} As b
        On a.hk_bestellung_h = b.hk_bestellung_h
)
,

kunde_info As (
    Select * From {{ ref('hub_kunde') }}
)

Select
    fo.hk_kunde_h,
    o.hk_bestellung_h,
    ki.kundeid,
    first_order_date,
    o.bestelldatum,
    Case
        When o.bestelldatum = fo.first_order_date Then 'New'
        Else 'Returning'
    End As customer_segment
From orders As o
Inner Join first_order As fo
    On o.hk_kunde_h = fo.hk_kunde_h
Inner Join kunde_info As ki
    On o.hk_kunde_h = ki.hk_kunde_h
Order By ki.kundeid, o.bestelldatum
