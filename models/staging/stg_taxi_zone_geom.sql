with source as (
    select *
    from {{ source('nyc_taxi', 'taxi_zone_geom') }}
),

cleaned_taxi_zones as (
select
    cast(zone_id as int64) as zone_id,
    zone_name as zone,
    borough
from source
)

select * from cleaned_taxi_zones
