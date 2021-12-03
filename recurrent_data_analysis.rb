#!/usr/bin/env ruby
require 'csv'
require 'set'
require 'date'

def charged_above(charge_percent, csv_path)
  cars_charged_above = Set.new

  CSV.read(csv_path, headers: true).each do |car|
    if car["charge_reading"] > charge_percent
      cars_charged_above << car["vehicle_id"]
    end
  end

  puts cars_charged_above.size
end

def average_daily_miles(vehicle_id, csv_path)
  first_day = nil
  last_day = nil
  first_odometer_reading = nil
  last_odometer_reading = nil

  CSV.read(csv_path, headers: true).each do |car|
    # this code depends the dates are ordered

    if car["vehicle_id"] == vehicle_id
      first_odometer_reading = car["odometer"].to_f unless first_odometer_reading
      last_odometer_reading = car["odometer"].to_f

      # this solution starts the day counting when the vehicle sends its first data,
      # which is not necessarily the earliest day entry for the entire dataset
      first_day = DateTime.parse(car["created_at"]).to_date unless first_day
      last_day = DateTime.parse(car["created_at"]).to_date
    end
  end
  # this will turn funky if the odometer resets, will add negative miles
  # TODO handle 0
  puts (last_odometer_reading - first_odometer_reading) / (last_day - first_day).to_i
end

def recurrent_data_analysis(csv_path, query, arg)

  case query
  when "charged_above"
    charged_above(arg, csv_path)
  when "average_daily_miles"
    average_daily_miles(arg, csv_path)
  else
    puts "Query doesn't exist, please ask for charged_above or average_daily_miles"
  end
end

def main
  if ARGV.length == 0 # We want to make sure we have an argument.
    puts "Please provide path to the data and analysis method!"
  else
    csv_path = ARGV[0] || 'ev_data.csv'
    query = ARGV[1]
    arg = ARGV[2]
    recurrent_data_analysis(csv_path, query, arg)
  end
end

main if __FILE__ == $PROGRAM_NAME