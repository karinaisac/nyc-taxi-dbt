with trips_enriched as (
select * from {{ ref('int_trips_enriched') }}
)

select
*,
timestamp_diff(dropoff_datetime, pickup_datetime, minute) as trip_duration_minutes

from trips_enriched
