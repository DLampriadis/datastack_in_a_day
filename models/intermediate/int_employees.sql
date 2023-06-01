with

employees as (
    select
        *
    from {{ ref('stg_employees') }}
),

emp_info as (
    select
            employee_id
        ,   first_name
        ,   last_name
    from {{ ref('stg_employee_info') }}
)

select
        employees.* 
    ,   emp_info.first_name
    ,   emp_info.last_name
from employees
join emp_info
on emp_info.employee_id = employees.employee_id