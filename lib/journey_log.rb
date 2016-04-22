class JourneyLog


  def initialize(journey_class = Journey)
    @journeys = []
    @current_journey = {}
    @journey_class = journey_class.new
  end

  def start(entry_station)
    @current_journey[:begin] = entry_station
  end

  def finish(exit_station)
    @current_journey[:end] = exit_station
    @journeys << @current_journey
    # @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  def in_journey?
    @current_journey.has_key?(:begin) && !@current_journey.has_key?(:end)
    # @journey_class.in_journey?
  end

  def fare_calculator
    @current_journeys.has_key?(:begin) && @current_journey.has_key?(:end) ? MIN_FARE : PENALTY_FARE
    # @journey_class.fare_calculator
  end

  def current_journey
    @current_journey.dup
  end
end
