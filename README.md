# nyc-taxi-dbt

For my project, I used a public dataset that is available on BigQuery that documents taxi trips in New York City. My goal with this data was to create models and views that answered the business question(s) of "How can NYC taxi operations be analyzed to understand demand patterns and revenue drivers". Since the dataset is very large, I opted to use data from 2022 only and to include both yellow and green cabs.  

The data was first opened in BigQuery, then connected to dbt, cleaned and transformed, and then connected to Looker to create a dashboard. In dbt, the data was cleaned and transformed. In my case, since the data was complex, it underwent all three stages of modeling: staging, intermediate, and marts. The staging model involved multiple casts to correct data types and elimination of outliers, such as taxi rides in years other than 2022. In the staging model, data for yellow and green cabs was unioned and then the dimensions data on pickup and dropoff zone names was added, as well as the trip duration. In the marts models, the locations dimension was kept separate, the full fact table for all trips was created, and a daily summary table of key metrics was created for a snapshot of each day (daily average fare, trip distance, trip duration, total passengers, etc.).

The resulting lineage of the models is detailed below: 


<img width="1827" height="482" alt="full lineage" src="https://github.com/user-attachments/assets/04d257c4-2117-40ba-be43-1bd2cb037764" />


For charts, there are many possibilities here and my dashboard does not cover them all, but I chose to focus on three topics.

The first is total revenue by trip month and cab type:


<img width="727" height="562" alt="taxi 1" src="https://github.com/user-attachments/assets/5b99a774-29f8-411f-915d-cf4399845087" />


This could be used to identify any seasonal factors that affect demand and to plan supply, keeping in mind changing demand over months. Unfortunately, the data was mostly missing for November and December, so I had to omit that data, since it was skewing the results. 

The second is total revenue by rate code and cab type:


<img width="750" height="557" alt="taxi 2" src="https://github.com/user-attachments/assets/f95b82da-cfa8-4dd7-b147-8278ef13ce9d" />


The rate code is specific to New York City and was added as an additional legend for clarity. Looking at the data, we can see that the majority of revenue comes from standard rate rides and rides to JFK are in second place. There is also a significant difference in the revenue between rides to JFK and rides to Newark.

And the third is the number of trips by pickup borough/dropoff borough and cab type:


<img width="732" height="532" alt="taxi 3" src="https://github.com/user-attachments/assets/4c36d9b7-8356-490c-b54f-0521112a7519" />
<br>
<img width="737" height="527" alt="taxi 4" src="https://github.com/user-attachments/assets/7594a031-b74e-4ca4-9d6c-23c32b6d9ee7" />


When looking at the pickup and dropoff locations, we can see that the majority of rides take place in Manhattan. However, when looking at the dropoff location, Brooklyn has a higher rate, so it likely indicates that rides are hailed from Manhattan to Brooklyn, but not the other way around.

A comment on all the charts: green cab rides comprise a tiny portion of all rides, with yellow cabs comprise the majority. When looking deeper into the data and looking at general trends, it might even make sense to omit the data of green cabs overall, but that would, of course, depends on the topic of the analysis.

## View the full Looker dashboard here: https://datastudio.google.com/reporting/f156d6a6-cfcb-4a24-bff4-427bc838698d 
