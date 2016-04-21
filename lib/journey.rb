require_relative 'oystercard'
class Journey
attr_reader :complete, :journey_log
MIN_FARE = 1
PENALTY_FARE = 6

  def initialize
    # @complete = true
    @journey_log = {}
  end

  def start(entry_station)
    # @complete =false
    @journey_log[:begin] = entry_station
  end

  def finish(exit_station)
    @journey_log[:end] = exit_station
    # @complete = true
  end

  def fare_calculator
    @journey_log.has_key?(:start) && @journey_log.has_key?(:end) ? MIN_FARE : PENALTY_FARE
  end



  # def complete?
  #   @complete
  # end

end
