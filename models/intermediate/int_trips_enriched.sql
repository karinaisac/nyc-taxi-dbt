with trips as (
select * from {{ ref('int_trips_union') }}
),

with pickup_zones as (
select * from {{ ref('stg_taxi_zone_geom') }}
),

with dropoff_zones as (
select * from {{ ref('stg_taxi_zone_geom') }}
),

select
    trips.*,
    pickup_zones.zone as pickup_zone,
    pickup_zones.borough as pickup_borough,
    dropoff_zones.zone as dropoff_zone,
    dropoff_zones.borough as dropoff_borough
from trips
left join pickup_zones
    on trips.pickup_location_id = pickup_zones.zone_id
left join dropoff_zones
    on trips.dropoff_location_id = dropoff_zones.zone_id

left join {{ ref('stg_taxi_zone_geom') }} as pickup_zones
on trips.pickup_location_id = pickup_zones.pickup_location_id

left join {{ ref('stg_taxi_zone_geom') }} as dropoff_zones
on trips.dropoff_location_id = pickup_zones.dropoff_location_id