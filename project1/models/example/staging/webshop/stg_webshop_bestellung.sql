{{ config(materialized='view') }}

with source as (

    select
        order_id,
        customer_id,
        order_date,
        total_amount

    from {{ source('src_system', 'order') }}

),

hashed as (

    select
        *,
        -- Business key hashes
        {{ datavault4dbt.hash_key(['order_id']) }} as order_hk,
        {{ datavault4dbt.hash_key(['customer_id']) }} as customer_hk,

        -- Link hash key (order-customer relationship)
        {{ datavault4dbt.hash_key(['order_id', 'customer_id']) }} as order_customer_lk,

        current_timestamp as load_date,
        'SRC_ORDER' as record_source

    from source

)

select * from hashed
