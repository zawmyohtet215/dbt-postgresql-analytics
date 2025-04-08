with orders as (
    SELECT * FROM {{ref('stg_salesorder')}}
),
order_details as (
    SELECT * FROM {{ref('stg_orderdetail')}}
),
product as (
    SELECT * FROM {{ref('stg_product')}}
)

SELECT
    o.orderid,
    o.orderdate,
    od.productid,
    p.productname,
    od.unitprice,
    od.qty,
    od.discount,
    (od.unitprice * od.qty * (1 - od.discount)) as revenue
FROM orders o
JOIN order_details od ON o.orderid = od.orderid
JOIN product p ON od.productid = p.productid