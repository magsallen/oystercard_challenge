class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :list
  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f
  MINIMUM_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0.00
    @list = {}
  end

  def top_up(money)
    fail "£#{DEFAULT_LIMIT} is the top up limit £#{BALANCE}" if limit_reached?(money)
    @balance += money
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station_in)
    # tell Journey.start to set in_journey to true
    # tell Journey.complete? to false
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    @entry_station = station_in

  end

  def touch_out(station_out)
    @exit_station = station_out
    @list[@entry_station] = @exit_station
    deduct
    @entry_station = nil
    @exit_station = nil
  end

private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= FARE
  end
end
