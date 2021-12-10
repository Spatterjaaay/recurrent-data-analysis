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
  it "returns correct result for a given vehicle" do
    answers = [["cat-car", 5.357142857142857], ["clown-car", 5.857142857142857]]
    answers.each { |vehicle, result|
      expect(average_daily_miles(vehicle, "ev_data.csv")).must_equal result
    }
  end

  it "returns 0 if no vehicle with user specified ID exists" do
    expect(average_daily_miles("unknown", "ev_data.csv")).must_equal 0
  end

  it "raises an error for a bad file" do
    expect {
      average_daily_miles("cat-car", "data.csv")
    }.must_raise Errno::ENOENT
  end

end