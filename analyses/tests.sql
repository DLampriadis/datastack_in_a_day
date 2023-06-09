{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where updated_at > (select max(updated_at) from {{ this }})

{% endif %}



        materialized = 'incremental',