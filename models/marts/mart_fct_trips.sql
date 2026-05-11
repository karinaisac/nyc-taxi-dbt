with source as (
select * from {{ ref('int_trips_enriched') }}
)

select
    vendor_id,
    pickup_datetime,
    dropoff_datetime,
    rate_code,
    passenger_count,
    trip_distance,
    fare_amount,
    total_amount,
    tip_amount,
    pickup_zone,
    pickup_borough,
    dropoff_zone,
    dropoff_borough,
    trip_duration_minutes,
    cab_type

from source
