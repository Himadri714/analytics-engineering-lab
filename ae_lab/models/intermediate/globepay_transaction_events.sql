{{ config(
    materialized='view'
) }}

SELECT
    a.external_ref,
    a.status,
    a.payment_source,
    a.merchant_reference,
    CAST(a.transaction_timestamp AS DATE) AS transaction_date,
    a.state,
    a.cvv_provided,
    a.amount,
    a.country,
    a.currency,
    c.chargeback,

    CASE
        WHEN a.state = 'ACCEPTED' THEN 1
        ELSE 0
    END AS is_accepted,
    CASE
        WHEN a.state = 'DECLINED' THEN 1
        ELSE 0
    END AS is_declined,
    CASE
        WHEN c.chargeback IS NULL THEN 1
        ELSE 0
    END AS missing_chargeback

FROM {{ ref('stg_globepay_acceptance') }} AS a
LEFT JOIN {{ ref('stg_globepay_chargeback') }} AS c
    ON a.external_ref = c.external_ref
