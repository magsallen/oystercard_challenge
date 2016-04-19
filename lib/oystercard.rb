class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end


  def top_up(value)
    fail "Maximum balance is £#{MAX_BALANCE}" if exceeds_max_balance?(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


  private

  def exceeds_max_balance?(value)
    @balance + value > MAX_BALANCE
  end

end
