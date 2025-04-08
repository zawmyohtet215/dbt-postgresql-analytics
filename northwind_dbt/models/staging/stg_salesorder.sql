with raw as (
    SELECT * FROM {{source('northwind', 'salesorder')}}
)

SELECT
    orderid, custid, empid, orderdate, requireddate, shippeddate, shipperid, freight
FROM raw