with yellow_trips as (
    select *,
    null as trip_type, 
    'yellow' as cab_type 
    from {{ ref('stg_yellow_trips_2022') }}
),

green_trips as (
    select *,
    trip_type,
    'green' as cab_type
    from {{ ref('stg_green_trips_2022') }}
)

select * from yellow_trips
union all
select * from green_trips
