with raw as (
    SELECT * FROM {{source('northwind', 'customer')}}
)

SELECT
    custid, companyname, contactname, contacttitle, address, city
FROM raw