class Journey
attr_reader :complete

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
    # calculate fare
  end

  def complete?
    @complete
  end

end
