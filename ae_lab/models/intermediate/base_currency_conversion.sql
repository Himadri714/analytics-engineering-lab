{{ config(
    materialized='view'
) }}

SELECT
    external_ref,
    currency AS base_currency,
    f.key::string AS conversion_currency,
    f.value::float AS conversion_rate
FROM {{ ref('stg_globepay_acceptance') }},
    LATERAL FLATTEN(input => TRY_PARSE_JSON(rates)) AS f
