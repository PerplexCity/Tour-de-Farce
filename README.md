# Tour de Farce

All of the data analysis used in the article starts by running the [citibike_parse.py](../master/citibike_parse.py) script on all twelve monthly data sets from 2015 that [Citi Bike provides] (https://s3.amazonaws.com/tripdata/index.html). 

[bikeroutes.csv](../master/bikeroutes.csv) is the result, albeit purged of routes with zero ridership and with a few extra columns expressing certain ratios (male/female, young/old, etc.). Originally the article included discussion of some of these demographic trends, but ultimately they were left for a later post so that this one could focus on the "race."

Once the race route was determined, the monthly data is fed again into a script, this time [bike_race.py](../master/bike_race.py), which simply transfers the four thousand or so routes that fit the criteria into [race_results.csv](../master/race_results.csv). From there sorting by time, age, year of birth, and so on is just a few clicks in Excel.

The density curves for Customers and Subscribers can be drawn with [rider_type.R](../master/rider_type.R).
