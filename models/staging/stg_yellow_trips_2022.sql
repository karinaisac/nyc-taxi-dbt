with source as (
    select *
    from {{ source('nyc_taxi', 'tlc_yellow_trips_2022') }}
),

cleaned_yellow_trips_2022 as (
select
    cast(vendor_id as int64) as vendor_id,
    pickup_datetime,
    dropoff_datetime,
    cast(rate_code as int64) as rate_code,
    cast(pickup_location_id as int64) as pickup_location_id,
    cast(dropoff_location_id as int64) as dropoff_location_id,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount
from source

    where trip_distance > 0
    and fare_amount > 0
    and total_amount > 0
    and pickup_datetime < dropoff_datetime
    and passenger_count > 0
    and extract(year from pickup_datetime) = 2022
    and extract(year from dropoff_datetime) = 2022
    and rate_code not in (0,99)
)

select * from cleaned_yellow_trips_2022