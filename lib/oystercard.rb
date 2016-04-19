class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90
  def initialize
    @balance = 0
  end


  def top_up(value)
    fail "Maximum balance is £#{MAX_BALANCE}" if exceeds_max_balance?(value)
    @balance += value
  end

  private

  def exceeds_max_balance?(value)
    @balance + value > MAX_BALANCE
  end

end
