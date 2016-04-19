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


end
