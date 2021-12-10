#!/usr/bin/env ruby
require 'csv'
require 'set'
require 'date'

def charged_above(charge_percent, csv_path)
  cars_charged_above = Set.new

  if charge_percent < "0.0" || charge_percent > "1.0"
    raise ArgumentError.new("Percent value must be between 0.0 and 1.0")
  end

  CSV.read(csv_path, headers: true).each do |car|
    if car["charge_reading"] > charge_percent
      cars_charged_above << car["vehicle_id"]
    end
  end

  return cars_charged_above.size
end

def average_daily_miles(vehicle_id, csv_path)
  first_day = nil
  last_day = nil
  first_odometer_reading = nil
  last_odometer_reading = nil

  CSV.read(csv_path, headers: true).each do |car|
    # Average is taken over the period of the data set,
    # not over the values that match vehicle_id specifically
    if !first_day
      first_day = DateTime.parse(car["created_at"]).to_date
    elsif DateTime.parse(car["created_at"]).to_date < first_day
      first_day = DateTime.parse(car["created_at"]).to_date
    end

    if !last_day
      last_day = DateTime.parse(car["created_at"]).to_date
    elsif DateTime.parse(car["created_at"]).to_date > last_day
      last_day = DateTime.parse(car["created_at"]).to_date
    end

    # this code depends on the values being ordered linearly in time
    if car["vehicle_id"] == vehicle_id
      first_odometer_reading = car["odometer"].to_f unless first_odometer_reading
      last_odometer_reading = car["odometer"].to_f
    end
  end
  # there was no car in dataset with specified vehicle_id
  if first_odometer_reading == nil
    return 0
  end

  # this will turn funky if the odometer resets, will add negative miles
  return (last_odometer_reading - first_odometer_reading) / (last_day - first_day + 1).to_i
end

def recurrent_data_analysis(csv_path, query, arg)
  case query
  when "charged_above"
    puts charged_above(arg, csv_path)
  when "average_daily_miles"
    puts average_daily_miles(arg, csv_path)
  else
    puts "Query doesn't exist, please ask for charged_above or average_daily_miles"
  end
end

def main
  if ARGV.length != 3 # We want to make sure we have an argument.
    puts "Please provide path to the data and analysis method!"
  else
    csv_path = ARGV[0]
    query = ARGV[1]
    arg = ARGV[2]
    recurrent_data_analysis(csv_path, query, arg)
  end
end

main if __FILE__ == $PROGRAM_NAME
