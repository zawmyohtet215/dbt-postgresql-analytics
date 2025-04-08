SELECT
    orderid,
    productid,
    orderdate,
    SUM(revenue) as total_revenue
FROM {{ref('int_sales_enriched')}}
GROUP BY orderid, productid, orderdate