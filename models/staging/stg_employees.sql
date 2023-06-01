select
        employee_id
    ,   date1 as starting_date
    ,   date2 as ending_date
    ,   team
from {{ source('fivetran_raw_data', 'employees') }}
where team > 10