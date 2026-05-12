with source as (
select * from {{ ref('int_trips_enriched') }}
)

select
    {{ dbt_utils.generate_surrogate_key([
        'vendor_id', 
        'pickup_datetime', 
        'dropoff_datetime'
    ]) }} as trip_id,
    vendor_id,
    pickup_datetime,
    dropoff_datetime,
    rate_code_id,
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
