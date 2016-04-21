require_relative 'journey'

class JourneyLog

  def initialize#(journey_class = Journey)
    @journeys = []
    @current_journey = {}
    @journey_class = Journey.new
  end

  def start(entry_station)
    @current_journey = { :begin => entry_station }
  end

  def finish(exit_station)
    @current_journey[:end] = exit_station
    @journeys << @current_journey
  end

  def journeys
    @journeys.dup
  end

  def in_journey?
    @journey_class.in_journey?
  end

  def fare_calculator
    @journey_class.fare_calculator
  end

  def current_journey
    @current_journey.dup
  end
end
