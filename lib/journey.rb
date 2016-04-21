require_relative 'oystercard'
class Journey
attr_reader :complete, :journey_log #:new_journey
MIN_FARE = 1
PENALTY_FARE = 6

  def initialize
    @journey_log = {}
    # @new_journey = self
  end

  def start(entry_station)
    @journey_log[:begin] = entry_station
  end

  def finish(exit_station)
    @journey_log[:end] = exit_station
    # @complete = true
  end

  def fare_calculator
    @journey_log.has_key?(:begin) && @journey_log.has_key?(:end) ? MIN_FARE : PENALTY_FARE
  end

end
