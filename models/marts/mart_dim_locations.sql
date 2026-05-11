with source as (
    select * from {{ ref('stg_taxi_zone_geom') }}
)

select
    zone_id,
    zone,
    borough
from source