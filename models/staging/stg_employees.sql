select
        employee_id
    ,   date1 as starting_date
    ,   date2 as ending_date
    ,   team
    ,   datediff(DAY, starting_date, CURRENT_DATE()) as days_at_work
from {{ source('fivetran_raw_data', 'employees') }}