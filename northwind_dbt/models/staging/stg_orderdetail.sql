with raw as (
    SELECT * FROM {{source('northwind', 'orderdetail')}}
)

SELECT orderid, productid, unitprice, qty, discount FROM raw