require 'journey'
describe Journey do
   it {is_expected.to respond_to :start}
   it {is_expected.to respond_to :finish}
   it {is_expected.to respond_to :fare_calculator}
   it {is_expected.to respond_to :journey_log}

   let(:entry_station) {double :entry_station}
   let(:exit_station) {double :exit_station}

    it 'start adds an entry station to the log' do
      subject.start(entry_station)
      expect(subject.journey_log[:begin]).to eq(entry_station)
    end

    it "finish adds an exit_station to the log" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journey_log[:end]).to eq(exit_station)
    end

    it "should calculate minimum fare for touch_in & touch_out" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare_calculator).to eq(described_class::MIN_FARE)
    end

    it "should calculate penalty fare for no exit station" do
      subject.start(entry_station)
      subject.start(entry_station)
      expect(subject.fare_calculator).to eq(described_class::PENALTY_FARE)
    end

    it "should calculate penalty fare for no entry station" do
      subject.finish(exit_station)
      expect(subject.fare_calculator).to eq(described_class::PENALTY_FARE)
    end

    it 'in_journey? should return true if journey in progress' do
      subject.start(entry_station)
      expect(subject.in_journey?).to be_truthy
    end


end
