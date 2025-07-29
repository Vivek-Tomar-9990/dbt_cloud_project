{{
  config(
    materialized='incremental',
    incremental_strategy='append',
    unique_key='trans_id'
  )
}}
SELECT
    trans_id,
    customer_id,
    product_id,
    amount,
    transaction_date,
    status,
    last_updated
FROM {{ source('raw_src', 'transactions') }}
{% if is_incremental() %}
  -- Only get transactions newer than our latest record
  WHERE last_updated > (SELECT MAX(last_updated) FROM {{ this }})
{% endif %}
