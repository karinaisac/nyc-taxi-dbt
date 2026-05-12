with source as (
    select *
    from {{ source('nyc_taxi', 'tlc_green_trips_2022') }}
),

cleaned_green_trips_2022 as (
select
    cast(vendor_id as int64) as vendor_id,
    pickup_datetime,
    dropoff_datetime,
    cast(rate_code as int64) as rate_code_id,
    cast(pickup_location_id as int64) as pickup_location_id,
    cast(dropoff_location_id as int64) as dropoff_location_id,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    cast(total_amount as float64) as total_amount,
    trip_type
from source

    where trip_distance > 0
    and fare_amount > 0
    and cast(total_amount as float64) > 0
    and pickup_datetime < dropoff_datetime
    and passenger_count > 0
    and extract(year from pickup_datetime) = 2022
    and extract(year from dropoff_datetime) = 2022
    and cast(rate_code as int64) not in (0,99)
)

select * from cleaned_green_trips_2022
