{{ config(materialized='ephemeral') }}
select
    order_id,
    to_date(created_at) as order_date,
    customer_id,
	order_amount,
	order_status
from {{ ref('stg_orders') }}
WHERE order_status = 'COMPLETED'