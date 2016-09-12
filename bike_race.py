import csv

files = ['201501-citibike-tripdata.csv', '201502-citibike-tripdata.csv', '201503-citibike-tripdata.csv', 
		'201504-citibike-tripdata.csv', '201505-citibike-tripdata.csv', '201506-citibike-tripdata.csv', 
		'201507-citibike-tripdata.csv', '201508-citibike-tripdata.csv', '201509-citibike-tripdata.csv', 
		'201510-citibike-tripdata.csv', '201511-citibike-tripdata.csv', '201512-citibike-tripdata.csv']

writer = csv.writer(open('race_results.csv', 'wb'))

for f in files:
	with open(f, 'rb') as csvfile:
		bikes = csv.reader(csvfile)
		next(csvfile)
		for row in bikes:
			if row[4] == '12 Ave & W 40 St' and row[8] == 'West St & Chambers St':
				writer.writerow(row)
