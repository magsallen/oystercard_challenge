require_relative "journey"
require_relative "station"
class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :list, :journey
  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f
  MINIMUM_BALANCE = 1
  # FARE = 1

  def initialize
    @balance = 0.00
    @list = {}
    @journey = nil
  end

  def top_up(money)
    fail "£#{DEFAULT_LIMIT} is the top up limit £#{BALANCE}" if limit_reached?(money)
    @balance += money
  end

  def in_journey?
    !!@entry_station
  end

  # def create_journey
  #   journey = self.journey_method
  # end
  #

  def touch_in(station_in)
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    journey_method
    @journey.start
    @entry_station = station_in
  end

  def touch_out(station_out)
    @journey.finish
    @exit_station = station_out
    @list[@entry_station] = @exit_station
      # @journey.fare(@list[-1])
    deduct
    @entry_station = nil
    @exit_station = nil
    @journey = nil
  end

# private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= @journey.fare
  end

  def journey_method
    @journey = Journey.new
    # @journey.start
  end

end
