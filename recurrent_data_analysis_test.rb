require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'recurrent_data_analysis'

Minitest::Reporters.use!

describe "charged_above" do
  it "returns the correct number of cars charged above given percentage" do
    expect(charged_above("0.4", 'ev_data.csv')).must_equal 5
    expect(charged_above("0.1", 'ev_data.csv')).must_equal 5
    expect(charged_above("0.0", 'ev_data.csv')).must_equal 5
    expect(charged_above("1.0", 'ev_data.csv')).must_equal 0
    expect(charged_above("0.99", 'ev_data.csv')).must_equal 4
  end
end

describe "average_daily_miles" do
  it "returns correct result for a vehicle" do
    
  end

  it "returns feedback if no vehicle with user specified ID exists" do

  end

end