{% macro create_rla_employees(database, schema) %}
    {% set seed_schema='seeds' %}

    CREATE OR REPLACE ROW ACCESS POLICY {{ database }}.{{ schema }}.rla_employees
    AS (team int) RETURNS BOOLEAN ->
        'ACCOUNTADMIN' = CURRENT_ROLE()
        OR 'DEVELOPER' = CURRENT_ROLE()
        OR EXISTS (
                SELECT * FROM {{ database }}.{{ seed_schema }}.map_tbl_managers
                WHERE 1=1
                    AND username = lower(current_role())
                    -- AND username = lower(CURRENT_USER())
                    AND team = manager_team
            )

{% endmacro %}