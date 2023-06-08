WITH 

customers as (
    select
        c_custkey         as cust_key
    ,   c_name            as cust_name
    ,   c_acctbal         as cust_acc_bal
    ,   c_address         as cust_address
    ,   c_phone           as cust_phone
    ,   c_comment         as comment
    ,   c_mktsegment      as market_segment
    ,   c_nationkey
    from {{ source('fivetran_fivetran_schema1', 'customer') }}
),

nations as (
    select
        n_nationkey
    ,   n_regionkey
    ,   n_name as country
    from {{ source('fivetran_fivetran_schema2', 'nation')}}
),

regions as (
    select
        r_regionkey
    ,   r_name as region_name
    from {{ source('fivetran_fivetran_schema2', 'region') }}
)

select
        customers.cust_key
    ,   customers.cust_name
    ,   customers.cust_acc_bal
    ,   customers.cust_address
    ,   customers.cust_phone
    ,   customers.comment
    ,   customers.market_segment
    ,   nations.country
    ,   regions.region_name
from customers
join nations
on nations.n_nationkey = customers.c_nationkey
join regions
on nations.n_regionkey = regions.r_regionkey
