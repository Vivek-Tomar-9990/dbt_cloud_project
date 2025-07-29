SELECT * FROM 
{{ ref('stg_products') }}
where price <0