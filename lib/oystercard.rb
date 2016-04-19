class Oystercard

  attr_reader :balance

  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f


  def initialize
    @balance = 0.00

  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit of £#{DEFAULT_LIMIT}. Your current balance is £#{@balance}" if limit_reached?(money)

      @balance += money
  end

  def deduct
  end

private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end
end
