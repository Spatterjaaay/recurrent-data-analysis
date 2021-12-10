require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'recurrent_data_analysis'

Minitest::Reporters.use!

describe "charged_above" do
  it "returns the correct number of cars charged above given percentage" do
    answers = [["0.4", 5], ["1.0", 0], ["0.99", 4]]
    answers.each { |arg, result|
      expect(charged_above(arg, "ev_data.csv")).must_equal result
    }
  end

  it "raises an error for bad percent argument" do
    expect {
      charged_above("2", "ev_data.csv")
    }.must_raise ArgumentError
  end

  it "raises an error for a bad file" do
    expect {
      charged_above("1", "data.csv")
    }.must_raise Errno::ENOENT
  end
end

describe "average_daily_miles" do
  it "returns correct result for a vehicle" do
    
  end

  it "returns feedback if no vehicle with user specified ID exists" do

  end

end