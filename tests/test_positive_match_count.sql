-- tests/test_positive_match_count.sql
with test_data as (
    select *
    from {{ ref('customers_in_campaign') }}  -- replace with the actual model name
)

select email
from test_data
where match_count < 1
  and email is not null
