require 'oystercard'

describe Oystercard do
subject (:card) {described_class.new}

  describe '#initialize' do

    it 'should have a balance of 0' do
      expect(card).to respond_to(:balance).with 0
    end

    # it 'should initlaize with a default balance' do
    #   expect(subject.balance?).to eq(Oysetcard::DEFAULT_BALANCE)
    # end

  end

  # describe '#top_up' do
  #
  #   it{should respond_to(:top_up)}
  #
  #   it 'should be able to be topped up'
  #     expect(subject.top_up).to change(balance)
  #   end
  #
  #
  # end


end
