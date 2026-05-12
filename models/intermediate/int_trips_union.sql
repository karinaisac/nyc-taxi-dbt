with yellow_trips as (
    select
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        rate_code_id,
        pickup_location_id,
        dropoff_location_id,
        passenger_count,
        trip_distance,
        fare_amount,
        tip_amount,
        total_amount,
        cast(null as string) as trip_type,
        'yellow' as cab_type
    from {{ ref('stg_yellow_trips_2022') }}
),

green_trips as (
    select
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        rate_code_id,
        pickup_location_id,
        dropoff_location_id,
        passenger_count,
        trip_distance,
        fare_amount,
        tip_amount,
        total_amount,
        trip_type,
        'green' as cab_type
    from {{ ref('stg_green_trips_2022') }}
),

all_trips as (
select * from yellow_trips
union all
select * from green_trips
),

deduped as (
    select *
    from all_trips
    qualify row_number() over (
        partition by vendor_id, pickup_datetime, dropoff_datetime
        order by vendor_id
    ) = 1
)

select * from deduped