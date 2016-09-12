import csv
from datetime import datetime

#all twelve months from 2015
files = ['201501-citibike-tripdata.csv', '201502-citibike-tripdata.csv', '201503-citibike-tripdata.csv', 
		'201504-citibike-tripdata.csv', '201505-citibike-tripdata.csv', '201506-citibike-tripdata.csv', 
		'201507-citibike-tripdata.csv', '201508-citibike-tripdata.csv', '201509-citibike-tripdata.csv', 
		'201510-citibike-tripdata.csv', '201511-citibike-tripdata.csv', '201512-citibike-tripdata.csv']

stops = []


#fill stop list with any dock that started or finished a ride
for f in files:
	with open(f, 'rb') as csvfile:
		bikes = csv.reader(csvfile)
		for row in bikes:
			stops.append(row[3])
			stops.append(row[7])


#dictionary to hold route information
master = {('startID','endID',): ['freq', 'weekdays', 'weekends', 'male', 'female', '1990+', '1980s', '1970s',
						'1960s','1950s','1949-', 'jan', 'feb', 'mar', 'apr',
						'may', 'jun', 'jul', 'aug', 'sept', 'octo', 'nov', 'dec', 'normal', 'night']}

#fills dictionary with empty route information
for i in set(stops):
	for j in set(stops):
			master[(i,j)] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 


# reopen data, parse route info
for f in files:
	with open(f, 'rb') as csvfile2:
		bikes = csv.reader(csvfile2)
		next(csvfile2)

		for row in bikes:
			print row[1]

			#converts date
			try:
				date = datetime.strptime(row[1], '%m/%d/%Y %H:%M')

			except ValueError:
				date = datetime.strptime(row[1], '%m/%d/%Y %H:%M:%S')

			except ValueError:
				date = "pass"



			#each row's information will be logged by referring to its route from the fourth and eighth columns

			#logs frequency
			master[(row[3], row[7])][0] += 1


			if date != "pass":
				#logs weekday and weekend rides
				if date.weekday() == 5 or date.weekday() == 6:
					master[(row[3], row[7])][2] += 1
				elif date.weekday() == 0 or date.weekday() == 1 or date.weekday() == 2 or date.weekday() == 3 or date.weekday() == 4:
					master[(row[3], row[7])][1] += 1
				else:
					pass


				#logs month to month rides, converts date.month to index of list in dictionary value 
				if date.month >=1 and date.month <= 12:
					master[(row[3], row[7])][date.month + 10] += 1

				else:
					pass

				#logs rides that take place between 10 PM and 4 AM
				if date.hour >= 4 and date.hour <= 21:
					master[(row[3], row[7])][23] += 1

				elif date.hour < 4 or date.hour > 21:
					master[(row[3], row[7])][24] += 1

				else:
					pass


			#logs gender of rider (only available for subscribers)
			if int(row[-1]) == 1:
				master[(row[3], row[7])][3] += 1

			elif int(row[-1]) == 2:
				master[(row[3], row[7])][4] += 1

			else:
				pass


			#logs DOB decade info for riders (only available for subscribers)
			try:
				year = int(row[-2])
				if year > 1989:
					master[(row[3], row[7])][5] += 1

				elif year > 1979 and year < 1990:
					master[(row[3], row[7])][6] += 1

				elif year > 1969 and year < 1980:
					master[(row[3], row[7])][7] += 1
					
				elif year > 1959 and year < 1970:
					master[(row[3], row[7])][8] += 1
					
				elif year > 1949 and year < 1960:
					master[(row[3], row[7])][9] += 1
					
				elif year < 1950:
					master[(row[3], row[7])][10] += 1

				else:
					pass

			except ValueError:
				pass



#write all route info to CSV

writer = csv.writer(open('bikeroutes.csv', 'wb'))
for key, value in master.items():
   writer.writerow([key, value])
