require_relative 'oystercard'
class Journey
attr_reader :complete

FARE = 5
 def initialize
   @complete = true
 end

  def start
    @complete =false
    # something else?
    end

  def finish
    @complete = true
  end

  def fare
    1
  # (@list[-1])
  #   #   @list[-1] - split into key and value
  #   # calculate fare
  end

  def complete?
    @complete
  end

end
