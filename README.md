# nyc-taxi-dbt

## Overview
An end-to-end analytics project using the public NYC Taxi Trips dataset available on BigQuery. The central business question is: **"How can NYC taxi operations be analyzed to understand demand patterns and revenue drivers?"**

The project covers data from **2022 only** (filtered to reduce volume) and includes both **yellow and green cab** trips. Data was loaded in BigQuery, transformed in dbt across three modeling layers, and visualized in a Looker dashboard.

## Stack
- **Warehouse:** Google BigQuery
- **Transformation:** dbt
- **Visualization:** Looker
- **Source data:** NYC Taxi Trips public dataset (BigQuery)

## Data Limitations
- **Nov–Dec 2022 data:** Largely missing for both cab types and was excluded, as it was skewing revenue totals.
- **Green cab volume:** Green cab trips represent a very small fraction of total rides. Depending on the analysis, it may make sense to exclude them for cleaner trend lines.

## Model Structure

```
models/
├── staging/
│   ├── stg_yellow_trips.sql       -- Cast types, filter to 2022, remove outliers
│   ├── stg_green_trips.sql        -- Cast types, filter to 2022, remove outliers
│   └── stg_taxi_zones.sql         -- Pickup/dropoff zone reference data
├── intermediate/
│   └── int_taxi_trips.sql         -- Union yellow + green, join zones, add trip duration
└── marts/
    ├── dim_taxi_zones.sql          -- Location dimension (pickup/dropoff zone names)
    ├── fct_taxi_trips.sql          -- Full fact table for all 2022 trips
    └── fct_daily_summary.sql       -- Daily aggregates: avg fare, distance, duration, passengers
```

**Data flow:** Sources → Staging → Intermediate → Marts → Looker

### Full lineage 
<img width="1827" height="482" alt="full lineage" src="https://github.com/user-attachments/assets/04d257c4-2117-40ba-be43-1bd2cb037764" />

## Dashboard & Key Findings
For charts, there are many possibilities here and my dashboard does not cover them all, but I chose to focus on three topics.

### Revenue by month and cab type
<img width="727" height="562" alt="taxi 1" src="https://github.com/user-attachments/assets/6b9b5bf3-3191-44db-8920-094b354e288e" />

Highlights seasonal demand patterns across the year. Nov–Dec data was excluded due to significant gaps that skewed results.

### Revenue by rate code and cab type
<img width="750" height="557" alt="taxi 2" src="https://github.com/user-attachments/assets/8d0fa5a6-ee2a-46f2-a692-22a3cca6b4e5" />


The NYC rate code breakdown reveals that standard-rate rides dominate revenue, with JFK airport rides in second place. There is a notable revenue gap between JFK and Newark rides, suggesting either lower volume or lower average fares on the Newark route.

### Trips by pickup and dropoff borough
<img width="732" height="532" alt="taxi 3" src="https://github.com/user-attachments/assets/ac08f475-3a97-40c3-af2d-94ff5b1229ef" />
<br>   
<img width="737" height="527" alt="taxi 4" src="https://github.com/user-attachments/assets/e7d4052e-6d48-40a7-b9d0-7f338ecadbd2" />


Manhattan dominates pickup volume, but Brooklyn has a disproportionately higher share of dropoffs — consistent with a pattern of rides being hailed from Manhattan to Brooklyn, with little reverse traffic. Green cabs account for a very small share across all charts; whether to include or exclude them depends on the specific analysis being conducted.

## View the full Looker dashboard here: https://datastudio.google.com/reporting/f156d6a6-cfcb-4a24-bff4-427bc838698d 
