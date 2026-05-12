# nyc-taxi-dbt

For my project, I used a public dataset that is available on BigQuery that documents taxi trips in New York City. My goal with this data was to create models and views that answered the business question(s) of "How can NYC taxi operations be analyzed to understand demand patterns, revenue drivers, and trip efficiency". Since the dataset is very large, I opted to use data from 2023 only and to include both yellow and green cabs.  

The data was first opened in BigQuery, then connected to dbt, cleaned and transformed, and then connected to Looker to create a dashboard. In dbt, the data was cleaned and transformed. In my case, since the data was complex, it underwent all three stages of modeling: staging, intermediate, and marts. The staging model involved multiple casts to correct data types and elimination of outliers, such as taxi rides in years other than 2022. In the staging model, data for yellow and green cabs was unioned and then the dimensions data on pickup and dropoff zone names was added, as well as the trip duration. In the marts models, the locations dimension was kept separate, the full fact table for all trips was created, and a daily summary table of key metrics was created for a snapshot of each day (daily average fare, trip distance, trip duration, total passengers, etc.).

The resulting lineage of the models is detailed below: 


<img width="1827" height="482" alt="full lineage" src="https://github.com/user-attachments/assets/04d257c4-2117-40ba-be43-1bd2cb037764" />


## View the full Looker dashboard here: 
