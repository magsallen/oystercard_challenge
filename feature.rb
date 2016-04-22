require './lib/oystercard'
require './lib/journey_log.rb'
require './lib/journey.rb'


oy = Oystercard.new
jl = JourneyLog.new
oy.top_up(20)
stn_1 = Station.new("stn_1", 2)
stn_2 = Station.new("stn_2", 4)
stn_3 = Station.new("stn_3", 5)

p oy.touch_out(stn_2)
puts oy.balance
