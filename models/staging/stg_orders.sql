{{ config(materialized='view') }}
SELECT
    id AS order_id,
    customer_id,
    status as order_status,
    total_amount as order_amount,
    created_at
FROM {{ source('raw_src', 'raw_orders') }}