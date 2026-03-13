{{ config(
    materialized='table'
) }}

SELECT
    t.external_ref,
    t.status,
    t.payment_source,
    t.transaction_date,
    t.payment_status,
    t.country,
    t.amount,
    t.currency,
    t.chargeback,
    (t.amount / c.conversion_rate) AS amount_in_usd
FROM {{ ref('globepay_transaction_events') }} AS t
INNER JOIN {{ ref('base_currency_conversion') }} AS c
    ON
        t.external_ref = c.external_ref
        AND t.currency = c.conversion_currency
