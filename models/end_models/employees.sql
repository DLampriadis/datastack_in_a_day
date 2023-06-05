{{
    config(
        post_hook=["{{ create_rla_employees(model.database, model.schema) }}",
                    "alter table {{ this }} add row access policy {{ model.database }}.{{ model.schema }}.rla_employees on (team)"
                    ]
    )
}}

select 
    *
from {{ ref('int_employees') }} 