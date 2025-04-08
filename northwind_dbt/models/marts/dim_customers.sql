SELECT DISTINCT
    custid, companyname, contactname, contacttitle, address, city
FROM {{ref('stg_customer')}}