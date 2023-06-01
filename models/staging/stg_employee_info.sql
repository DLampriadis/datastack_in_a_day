select
        id          as employee_id
    ,   first_name
    ,   last_name
from {{ source('fivetran_raw_data', 'employee_info') }}