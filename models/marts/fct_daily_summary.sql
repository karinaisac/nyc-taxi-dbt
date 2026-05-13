with source as (
select * from {{ ref('int_trips_enriched') }}
)

select
date(pickup_datetime) as trip_date,
format_date('%Y-%m', date(pickup_datetime)) as trip_month,
cab_type,
sum(total_amount) as total_revenue,
count(*) as total_trips,
avg(fare_amount) as avg_fare,
avg(trip_duration_minutes) as avg_trip_duration,
avg(trip_distance) as avg_trip_distance,
sum(passenger_count) as total_passengers

from source

group by trip_date, trip_month, cab_type