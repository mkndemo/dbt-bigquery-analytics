with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select 
        ID as customer_id,
        first_name,
        last_name,
        -- just for demo dummy email!
        first_name || '.' || last_name || '@' || 
        CASE 
            WHEN rand() < 0.5 THEN 'gmail.com'
            ELSE 'hotmail.com'
        END AS email
    from source

)

select * from renamed
