{{ config(materialized='view') }}

with source as (

    select
        customer_id,
        customer_name,
        email,
        country,
        created_at,
        updated_at

    from {{ source('src_system', 'customer') }}

),

hashed as (

    select
        *,
        -- Business key hash (Hub)
        {{ datavault4dbt.hash_key(['customer_id']) }} as customer_hk,

        -- Load date (best-effort load timestamp or `current_timestamp`)
        current_timestamp as load_date,

        -- Record source (static identifier for traceability)
        'SRC_CUSTOMER' as record_source

    from source

)

select * from hashed
