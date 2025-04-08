SELECT DISTINCT
    productid,
    productname,
    categoryid
FROM {{ref('stg_product')}}