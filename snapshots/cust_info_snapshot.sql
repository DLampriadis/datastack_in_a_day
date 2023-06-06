{% snapshot cust_info_snapshot %}

{{
    config(
      
        target_schema='snapshots',
        strategy='check',
        unique_key='cust_key',
        check_cols=['cust_acc_bal', 'cust_name'],
    )
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}