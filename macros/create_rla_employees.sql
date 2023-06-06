{% macro create_rla_employees(database, schema) %}
    {% if target.name == 'prd' %}
        {% set seed_schema = 'seeds' %}
    {% endif %}

    {% if target.name == 'dev' %}
        {% set seed_schema = 'dbt_dev_seeds' %}
    {% endif %}

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