require_relative "station"

class Oystercard

  attr_reader :balance, :journey
  DEFAULT_LIMIT = 90
  BALANCE = @balance
  MINIMUM_BALANCE = 1
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(journey_log = JourneyLog, journey = Journey)
    @balance = 0
    @journey_log = journey_log.new
    @journey = journey.new
  end

  def top_up(money)
    fail "£#{DEFAULT_LIMIT} is the top up limit £#{BALANCE}" if limit_reached?(money)
    @balance += money
  end

  def touch_in(entry_station)
    # deduct if @journey_log.in_journey?
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    # journey_method
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct
  end

  # private

  def in_journey?
    @journey_log.in_journey?
  end

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= @journey_log.fare_calculator
  end

  # def journey_method
  #   @journey = Journey.new
  # end

end
