# GlobePay Analytics Engineering Project

This project provides an analytics engineering workflow using **dbt
and Snowflake** to transform GlobePay transaction data into
analytics‑ready models.\
The objective is to transform data, incorporate business logic, apply currency conversion and produce a final reporting
model.

------------------------------------------------------------------------

## Project Architecture

The project follows a **layered dbt modelling approach**.

### Sources (RAW Tables, loaded as CSV)

-   `globepay_acceptance`
-   `globepay_chargeback`

### Staging

-   `stg_globepay_acceptance`
-   `stg_globepay_chargeback`

### Intermediate

-   `base_currency_conversion` -- To handles FX currency conversion logic\
-   `globepay_transaction_events` -- combines acceptance and chargeback data for each transaction event

### Mart

-   `globepay_transaction_event_daily` -- final reporting model with USD
    conversion

------------------------------------------------------------------------

## Data Flow

CSV → Snowflake RAW tables → Staging models → Intermediate
transformations → Final Mart model

------------------------------------------------------------------------

## Setup

Clone the repository and create a Python environment.

``` bash
git clone <repo-url>
cd analytics-engineering-lab

python -m venv ae_dbt
source ae_dbt/bin/activate
pip install dbt-snowflake
```

Configure Snowflake credentials in `profiles.yml`.

------------------------------------------------------------------------

## Running dbt

``` bash
dbt debug
dbt seed
dbt run
dbt test
```

------------------------------------------------------------------------

## Tech Stack

-   dbt Core
-   Snowflake
-   Git / GitHub
