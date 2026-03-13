{{ config(
    materialized='view'
) }}

SELECT
    a.external_ref,
    a.status,
    a.payment_source,
    a.merchant_reference,
    CAST(a.transaction_timestamp AS DATE) AS transaction_date,
    a.state AS payment_status,
    a.cvv_provided,
    a.amount,
    a.country,
    a.currency,
    c.chargeback
FROM {{ ref('stg_globepay_acceptance') }} AS a
LEFT JOIN {{ ref('stg_globepay_chargeback') }} AS c
    ON a.external_ref = c.external_ref
