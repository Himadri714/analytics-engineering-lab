{{
 config (
 materialized = 'view'
 )
}}

SELECT
    external_ref,
    status,
    source AS payment_source,
    chargeback
FROM {{ source('globepay','GLOBEPAY_CHARGEBACK') }}
