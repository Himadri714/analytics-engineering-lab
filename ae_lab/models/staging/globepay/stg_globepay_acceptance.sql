{{
 config (
 materialized = 'view'
 )
}}

SELECT
    external_ref,
    status,
    source AS payment_source,
    ref AS merchant_reference,
    date_time AS transaction_timestamp,
    state,
    cvv_provided,
    amount,
    country,
    currency,
    rates
FROM {{ source('globepay','GLOBEPAY_ACCEPTANCE') }}
