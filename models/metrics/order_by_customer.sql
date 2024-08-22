select 
    count(*) as total, 
    customer_id,
    number_of_orders from {{ ref('fct_customer_orders') }}
group by customer_id,number_of_orders
having number_of_orders > 1