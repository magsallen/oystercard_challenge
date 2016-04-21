require_relative "journey"
require_relative "station"
class Oystercard

  attr_reader :balance, :journey
  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f
  MINIMUM_BALANCE = 1
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0.00
    @journey = Journey.new
  end

  def top_up(money)
    fail "£#{DEFAULT_LIMIT} is the top up limit £#{BALANCE}" if limit_reached?(money)
    @balance += money
  end

  def touch_in(entry_station)
    deduct if in_journey?
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    journey_method
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct
  end

  private

  def in_journey?
    @journey.in_journey?
  end

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= @journey.fare_calculator
  end

  def journey_method
    @journey = Journey.new
  end

end
