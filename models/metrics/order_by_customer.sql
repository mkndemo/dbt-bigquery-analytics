select * from {{ ref('dim_customers_in_campaign') }}
where match_count > 1