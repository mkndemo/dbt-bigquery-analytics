{{
    config(
        materialized='table'
    )
}}

with customers as (
    select
        email
    from
        {{ ref('fct_customer_orders') }}
),

campaigns as (
    select
        email
    from
        {{ ref('marketinggcp', 'customer_campaign') }}
),
 
joined_data as (
    select
        c.email
    from
        customers c
    inner join
        campaigns cc
    on
        c.email = cc.email
)

select
    email,
    count(*) as match_count
from
    joined_data
group by
    email
order by
    match_count desc
