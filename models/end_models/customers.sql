{{ config(
    pre_hook=[
      "{{ dbt_snow_mask.create_masking_policy('models') }}"
    ],
    post_hook=[
      "{{ dbt_snow_mask.apply_masking_policy('models') }}"
    ]
) }}

select *
from {{ ref('stg_customers') }}