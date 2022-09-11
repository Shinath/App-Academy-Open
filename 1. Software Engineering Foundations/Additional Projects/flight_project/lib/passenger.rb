class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(number)
    @flight_numbers.include?(number.upcase)
  end

  def add_flight(number)
    @flight_numbers << number.upcase unless has_flight?(number)
  end
end
