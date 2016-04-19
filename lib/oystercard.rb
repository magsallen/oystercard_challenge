class Oystercard
  attr_reader :balance, :entry_station, :journey_log
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_log = {}
  end


  def top_up(value)
    fail "Maximum balance is £#{MAX_BALANCE}" if exceeds_max_balance?(value)
    @balance += value
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    fail "insufficient funds" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    @journey_log["#{@entry_station}"] = station
    @entry_station = nil
    deduct(MIN_BALANCE)

  end

  private

  def exceeds_max_balance?(value)
    @balance + value > MAX_BALANCE
  end

  def deduct(value)
    @balance -= value
  end

end
