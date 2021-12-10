# Recurrent Data Analysis 

A command line program that performs queries on data collected from people's electric vehicles in the form of CSV.

## Requirements:
* [Ruby 2.4.0](link)
* [RubyGems 2.7.6](link)

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