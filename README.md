# Recurrent Data Analysis 

A command line program that performs queries on data collected from people's electric vehicles in the form of CSV.

## Requirements:
* [Ruby 3.0.3](https://www.ruby-lang.org/en/downloads/)

## Installing dependencies:
```
gem install minitest
gem install minitest-skip
gem install minitest-reporters 
```
## Synopsis:
```ruby recurrent_data_analysis.rb file query argument```

## Description:
The application takes three arguments, the relative path to the data formatted as a CSV, a query and an arguement for the given query.
The following options are available:
* `charged_above`: Returns the number of vehicles that
  reported at least one `charge_reading` above a given % over the whole time
  period. It takes a charge % as an argument, in the form of a
  decimal, for example 0.33 will be passed to indicate 33%.
* `average_daily_miles`: Returns the average daily miles for
  a given vehicle over the course of the time period of the dataset. It
  takes `vehicle_id` as an argument.

## To run this program:
1. clone this repository from GitHub, or download files to your system
2. navigate to the folder where the recurrent-data-analysis.rb is saved and run, for example, ```ruby recurrent_data_analysis.rb ev_data.csv average_daily_miles cat-car```

how to make script executable
sample input/output
assumptions
improvements

Ticket

A User story:
As a user of this command line application I want to know the number of cars that were not driven at a given date.

Task:
As a developer we should create a function that takes in user provided date as a parameter and return number of cars not driven on that specific date, based on an odometer reading value from a given dataset.
The function needs to appropriately handle user input that can have various formats and handle conditions such as date not found, and differentitate between no data for any car on that day and all cars were driven.

Acceptance criteria:

Discussion:
Some clarification is necessary to further discuss with the product owner/team. It should be established what is the underlying motivation for this feature, that will inform handling of corner cases and exceptions. 
A further dicussion is also needed to identify acceptable criteria for a car that was not driven on a user provided date.
For example, a specific car can have several datapoints present for each day, only one per day, or once per several days. The only guaranteed car that was not driven is when we have multiple datapoints across three consecutive days say the odometer reading has not changed and therefore the car was not driven on the middle date.
If the odometer reading shows a change between two consecutive days, it is unclear on which day the car actually moved. The gap is even wider if we do not have data for consecutive days. If we use odometer data over several days to identify a car that has moved, it will be also necessary to account for earliest and latest odometer reading in the dataset, as they have no predecessor or follower.
It is necessary for handling this use case to know how to interpret the data.
