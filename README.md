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

## To run tests:
1. navigate to the folder where the recurrent-data-analysis.rb is saved and run ```ruby recurrent_data_analysis_test.rb```

## Assumptions and Decisions
- the car data in the dataset is ordered linearly in time
- the program currently runs the interactive portion requiring user input as a command line application only
- `average_daily_miles` function doesn't currently handle the edge case of the odometer rolling over to 0
- 

## Improvements

## Ticket to implement a new query

### User story:
As a user of this command line application I want to know the number of cars that were not driven on a given date.

### Task:
As a developer we should extend the command line application to accept a new query `drove_nowhere` along with a date argument. Then we should implement the `drove_nowhere` function that:
* takes in a user provided date argument as a parameter
* returns a String representing the number of cars not driven on that specific date
* uses an odometer value from a given dataset as the bassis for the calculation.

The function needs to appropriately handle user input that can have various formats and handle edge cases such as the date falls outside the data set and exceptions, such as bad argument and no dataset file.

### Acceptance criteria:
* the function accepts a String value that is parsed as a date
* the function returns a numerical value expressing the number of cars not driven on the given date
* the function returns a String "no car data available for selected date" in the case of date falling outside the datatset.

### Discussion & Assumptions:
This ticket makes some assumptions about the desired implementation. It provides a suggestion for the return values, using the limited knowledge I have, to provide a more realistic ticket example consistent with the already written code. Were it a ticket at Recurrent, ideally there would be a discussion with the product owner/team first to clarify the goal and context of the task that would inform the output of various edge case and exceptions.  

Another important point for clarification would be the reliable identification of a `car not driven`. Based on the dataset provided in the exercise, a specific car can have several datapoints present for each day, only one per day, or once per several days. We can only guarantee a car **was** or **was not** not driven under certain conditions:
* when at least one datapoint across three consecutive days show the odometer reading has not changed (car was not driven on the middle day)
* when two or more datapoints in one day show a change in the odometer reading (the car was driven on that day)

Outside of those two conditions, if the odometer reading shows a change between two consecutive days, it is unclear on which day the car actually moved. The problem is compounded when there are missing odometer readings for the entire day, either for the given day or the days directly adjacent to it.

One approach I would suggest would be to return number of cars that we have the most confidence did not drive on that day (and not count cases where we are not 100% sure) by checking the last odometer measurement of the day before and first odometer measurement of the day after. In case one of the two is missing (which would be the case for example the beginning/end of the dataset) we substitute the mising odometer measurement with either first of last measurement of the given day.


