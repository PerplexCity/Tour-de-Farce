# Tour de Farce

All of the data analysis used in the article starts by running the [citibike_parse.py] script on all twelve monthly data sets from 2015 that [Citi Bike provides] (https://s3.amazonaws.com/tripdata/index.html). 

[bikeroutes.csv](../master/bikeroutes.csv) is the result, albeit purged of routes with zero ridership and with a few extra columns expressing certain ratios (male/female, young/old, etc.)

Once the race route was determined, the monthly data is fed again into a script, this time [bike_race.py](../master/bike_race.py), which simply transfers the four thousand or so routes that fit the criteria into [race_results.csv](../master/race_results.csv).

Graphs were made by sorting by routes with 1000+ frequency and assiging a ranking variable in [ordered_ratios.csv](../master/ordered_ratios.csv) and then running [ratio_graphs.R](../master/ratio_graphs.R)

