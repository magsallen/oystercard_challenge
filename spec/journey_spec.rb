require 'journey'
describe Journey do
  context "Method check" do
  #  it {is_expected.to respond_to :start}
  #  it {is_expected.to respond_to :finish}
   it {is_expected.to respond_to :fare_calculator}
  #  it {is_expected.to respond_to :journey_log}
  end

   let(:entry_station) {double :entry_station}
   let(:exit_station) {double :exit_station}
   let(:journey_log) {double :journey_log}
   let(:min_fare) {described_class::MIN_FARE}
   let(:penalty_fare) {described_class::PENALTY_FARE}
  # context 'Adds entry & exit stations' do
  #
  #   it 'start adds an entry station to the log' do
  #     subject.start(entry_station)
  #     expect(subject.journey_log[:begin]).to eq(entry_station)
  #   end
  #
  #   it "finish adds an exit_station to the log" do
  #     subject.start(entry_station)
  #     subject.finish(exit_station)
  #     expect(subject.journey_log[:end]).to eq(exit_station)
  #   end
  # end

    it 'in_journey? should return true if journey in progress' do
      allow(journey_log).to receive(:start).with(entry_station) {entry_station}
      allow(journey_log).to receive(:finish).with(exit_station) {exit_station}
      journey_log.start(entry_station)
      expect(subject.in_journey?).to be_truthy
    end

  context 'Calculates fare' do

    it "should calculate minimum fare for touch_in & touch_out" do
      allow(journey_log).to receive(:start).with(entry_station) {entry_station}
      allow(journey_log).to receive(:finish).with(exit_station) {exit_station}
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(subject.fare_calculator).to eq(min_fare)
    end

    it "should calculate penalty fare for no exit station" do
      allow(journey_log).to receive(:start).with(entry_station) {entry_station}
      allow(journey_log).to receive(:finish).with(exit_station) {exit_station}
      journey_log.start(entry_station)
      expect(subject.fare_calculator).to eq(penalty_fare)
    end

    it "should calculate penalty fare for no entry station" do
      allow(journey_log).to receive(:start).with(entry_station) {entry_station}
      allow(journey_log).to receive(:finish).with(exit_station) {exit_station}
      journey_log.finish(exit_station)
      expect(subject.fare_calculator).to eq(penalty_fare)
    end
  end
end
