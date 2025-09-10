{{ config(materialized='view') }}

{{ union_sats(
    ['sat_roadshow_kunde_v0', 'sat_webshop_kunde_v0'],   
    'hk_kunde_h',                                      
    'hd_kunde_s',                                      
    ['VORNAME','NAME','GESCHLECHT','GEBURTSDATUM','TELEFON','MOBIL','EMAIL','KREDITKARTE','GUELTIGBIS','KKFIRMA']                   
) }}
