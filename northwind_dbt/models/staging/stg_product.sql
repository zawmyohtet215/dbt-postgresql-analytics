with raw as (
    SELECT * FROM {{source('northwind', 'product')}}
)

SELECT
    productid, productname, supplierid, categoryid, unitprice
FROM raw