require 'oystercard'

describe Oystercard do
subject(:card) {described_class.new}
let(:max_bal)  {Oystercard::MAX_BALANCE}

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
      expect{card.top_up(1)}.to change{card.balance}
    end

    it 'should be topped up by the amount passed in' do
      expect{card.top_up(5)}.to change{card.balance}.by(5)
    end

    it 'prevents balance from exceeding £90' do
      card.top_up(90)
      expect{card.top_up(1)}.to raise_error("Maximum balance is £#{max_bal}")
    end

  end

  describe '#deduct' do

    it{should respond_to(:deduct)}

    it 'should deduct a passed value from the card balance' do
      expect{card.deduct(5)}.to change{card.balance}.by(-5)
    end

  end

  describe '#in_journey?' do

    it 'should be initialized with in_journey? as false' do
      expect(card.in_journey?).to eq(false)
    end

  end

  describe '#touch_in' do

    it'should change the value of in_journey to true' do
      card.touch_in
      expect(card).to be_in_journey
    end

  end

  describe '#touch_out' do

    it'should change the value of in_journey to false' do
      card.touch_out
      expect(card).not_to be_in_journey
    end


  end













end
