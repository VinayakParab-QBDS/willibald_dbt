{{ config(materialized='view') }}

with source as (

    select
        KUNDEID,
        VEREINSPARTNERID,
        VORNAME,
        NAME,
        GESCHLECHT,
        GEBURTSDATUM,
        TELEFON,
        MOBIL,
        EMAIL,
        KREDITKARTE,
        GUELTIGBIS,
        KKFIRMA

    from {{ source('roadshow', 'ROADSHOW_KUNDE') }}

),

hashed as (

    select
        *,
        -- Business key hashes
        {{ datavault4dbt.hash_key(['BESTELLUNGID']) }} as bestellung_hk,
        {{ datavault4dbt.hash_key(['KUNDEID']) }} as kunde_hk,

        -- hash key
        {{ datavault4dbt.hash_key(['BESTELLUNGID', 'KUNDEID']) }} as bestellung_kunde_lk,

        current_timestamp as load_date,
        'WEBSHOP' as record_source

    from source

)

select * from hashed


