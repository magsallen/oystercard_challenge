require_relative 'oystercard'
class Journey
attr_reader :complete, :journey_log

FARE = 5
 def initialize
   @complete = true
   @journey_log
 end

  def start(entry_station)
    # @complete =false
    @journey_log[:begin]=(entry_station)
    end

  def finish
    # @complete = true
  end

  def fare
    1
  # (@list[-1])
  #   #   @list[-1] - split into key and value
  #   # calculate fare
  end

  # def complete?
  #   @complete
  # end

end
