{% macro create_masking_policy_masking_customers(node_database,node_schema) %}

CREATE MASKING POLICY IF NOT EXISTS {{node_database}}.{{node_schema}}.masking_customers AS (val string) 
  RETURNS string ->
      CASE WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN') THEN val 
           WHEN CURRENT_ROLE() IN ('DEVELOPER') THEN SHA2(val)
      ELSE '**********'
      END

{% endmacro %}