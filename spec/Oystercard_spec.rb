require "oystercard"

describe Oystercard do

let (:penalty_fare) {described_class::PENALTY_FARE}
let (:default_limit) {described_class::DEFAULT_LIMIT}
let (:minimum_balance) {described_class::MINIMUM_BALANCE}
let (:balance) {described_class::BALANCE}
let (:min_fare) {described_class::MIN_FARE}

  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "increase balance by set amount" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  describe "#limit_reached" do
    it "raise error if #top_up(amount) puts balance over maximum limit." do
      message = "£#{default_limit} is the top up limit £#{balance}"
      expect{ subject.top_up 91 }.to raise_error message
    end
  end


  describe "#touch_in(station)" do

    let (:station) {double :station}

    it 'raises an error if balance below minimun limit' do
      expect{ subject.touch_in(station) }.to raise_error "Please top up, not enough credit"
    end
  end

  describe "#touch_out" do

    before(:each) do
      subject.top_up minimum_balance
      subject.touch_in(station)
    end

    let (:station) {double :station}
    let (:journey) {double :journey}

    it "deducts the fare from the oystercard" do
      allow(journey).to receive(:fare_calculator).and_return(min_fare)
      subject.top_up(10)
      subject.touch_in(station)
      expect{subject.touch_out(station)}.to change {subject.balance}.by(-min_fare)
    end
  end

  context 'Edge cases' do

    before(:each) do
      subject.top_up(default_limit)
      end

      let (:station) {double :station}
      let (:journey) {double :journey}

      it 'deducts penalty fare if no touch out' do
        allow(journey).to receive(:fare_calculator).and_return(penalty_fare)
        subject.touch_in(station)
        expect{subject.touch_in(station)}.to change{subject.balance}.by (-penalty_fare)
      end

      it 'deducts penalty fare if no touch in' do
        allow(journey).to receive(:fare_calculator).and_return(penalty_fare)
        expect{subject.touch_out(station)}.to change{subject.balance}.by(-penalty_fare)
      end
    end
end
