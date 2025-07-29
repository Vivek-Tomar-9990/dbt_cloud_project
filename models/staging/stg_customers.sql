{{ config(
    materialized='view',
    pre_hook="insert into audit_db.audit_sch.dbt_audits(model_name, status) values ('{{this.name}}', 'Start'); commit;",
    post_hook="insert into audit_db.audit_sch.dbt_audits(model_name, status) values ('{{this.name}}', 'End'); commit;"
    ) }}
SELECT
    id AS customer_id,
     upper(email) AS email,
    created_at
FROM {{ source('raw_src', 'raw_customers') }}