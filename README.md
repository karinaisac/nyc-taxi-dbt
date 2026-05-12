# nyc-taxi-dbt

For my project, I used a public dataset that is available on BigQuery that documents taxi trips in New York City. My goal with this data was to create models and views that answered the business question(s) of "How can NYC taxi operations be analyzed to understand demand patterns, revenue drivers, and trip efficiency". Since the dataset is very large, I opted to use data from 2023 only and to include both yellow and green cabs.  

The data was first opened in BigQuery, then connected to dbt, and then to Looker to create a dashboard. In dbt, the data was cleaned and transformed. In my case, since the data was complex, it underwent all three stages of modeling: staging, intermediate, and marts. 



## View the full Looker dashboard here: 
