require 'oystercard'

describe Oystercard do
subject(:card)   {described_class.new}
let(:card_new)   {described_class.new}
let(:max_bal)    {Oystercard::MAX_BALANCE}
let(:min_bal)    {Oystercard::MIN_BALANCE}
let(:test_value) {min_bal + 1}
let(:station)    {double("station")}
let(:station2)   {double("station")}

  describe '#initialize' do

    it 'should have a balance of 0' do
      expect(card).to respond_to(:balance).with 0
    end

    # it 'should initlaize with a default balance' do
    #   expect(subject.balance?).to eq(Oysetcard::DEFAULT_BALANCE)
    # end

  end

  describe '#top_up' do

    it{should respond_to(:top_up)}

    it 'should be able to be topped up' do
      expect{card.top_up(test_value)}.to change{card.balance}
    end

    it 'should be topped up by the amount passed in' do
      expect{card.top_up(test_value)}.to change{card.balance}.by(test_value)
    end

    it 'prevents balance from exceeding £90' do
      card.top_up(90)
      expect{card.top_up(1)}.to raise_error("Maximum balance is £#{max_bal}")
    end

  end

  describe '#in_journey?' do

    it 'should be initialized with in_journey? as false' do
      expect(card.in_journey?).to eq(false)
    end

  end

  describe '#touch_in' do

    it'should change the value of in_journey to true' do
      card.top_up(test_value)
      card.touch_in(station)
      expect(card).to be_in_journey
    end

    it "should raise error if balance is insufficient" do
      card_new = Oystercard.new
      card_new.top_up(min_bal - 1)
      expect{card.touch_in(station)}.to raise_error "insufficient funds"
    end

    it "should remember the touch-in station" do
      card.top_up(test_value)
      expect{card.touch_in(station)}.to change{card.entry_station}.to(station)
    end
  end

  describe '#touch_out' do

    it'should change the value of in_journey to false' do
      card.touch_out(station)
      expect(card).not_to be_in_journey
    end

    it 'reduces the balance by minimum fare' do
      card.top_up(test_value)
      card.touch_in(station)
      expect{card.touch_out(station)}.to change{card.balance}.by(-(min_bal))
    end

    it 'adds the journey to journey_log' do
      card.top_up(test_value)
      card.touch_in(station)
      expect{card.touch_out(station2)}.to change{card.journey_log.length}.by(1)
    end

  end













end
