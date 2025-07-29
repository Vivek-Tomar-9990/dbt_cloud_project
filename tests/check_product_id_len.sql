select * from {{ ref('stg_products') }}
where len(id) > 4