require 'journey'
describe Journey do
   it {is_expected.to respond_to :start}
   it {is_expected.to respond_to :finish}
   it {is_expected.to respond_to :fare_calculator}
  #  it {is_expected.to respond_to :complete?}
   it {is_expected.to respond_to :journey_log}

   let(:entry_station) {double :entry_station}
   let(:exit_station) {double :exit_station}

  #  it "should be complete" do
  #    expect(subject).to be_complete
  #  end
  #
  # describe '#{start}' do
  #   it "start sets compltete to false" do
  #     expect(subject).not_to be_complete
  #   end
  #   end

    # it 'creates a new journey' do
    #   expect(subject.start(entry_station)).to be_a Journey
    # end

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
  # it "finish sets compltete to true" do
  #   subject.start
  #   subject.finish
  #   expect(subject).to be_complete
  # end

# it 'is expected to charge a penalty fare when no touch in' do
#
# end



end

# describe '#initialize' do
#   it "starts as complete " do
#   expect(subject.complete?).to eq true
# end
# end

# describe '#start' do

# end
