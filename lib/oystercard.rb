require_relative "journey"
require_relative "station"
class Oystercard

  attr_reader :balance, :journey
  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f
  MINIMUM_BALANCE = 1
  # FARE = 1

  def initialize
    @balance = 0.00
    # @journey_log = {}
    @journey = nil
    @journey = Journey.new
  end

  def top_up(money)
    fail "£#{DEFAULT_LIMIT} is the top up limit £#{BALANCE}" if limit_reached?(money)
    @balance += money
  end

  def in_journey?
    # !!@entry_station
  end


  def touch_in(entry_station)
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    # journey_method
    @journey.start(entry_station)
    # @entry_station = station_in
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    # @exit_station = station_out
    # @journey_log[@entry_station] = @exit_station
      # @journey.fare(@list[-1])
    deduct
    # @entry_station = nil
    # @exit_station = nil
    @journey = nil
  end

# private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= @journey.fare_calculator
  end

  # def journey_method
  #   @journey = Journey.new
  #   # @journey.start
  # end

end
