require 'journey_log'

describe JourneyLog do

  it {is_expected.to respond_to :start}
  it {is_expected.to respond_to :finish}
  it {is_expected.to respond_to :journeys}
  it {is_expected.to respond_to :current_journey}

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe '#start' do

    it 'start adds an entry station to the log' do
      subject.start(entry_station)
      expect(subject.current_journey[:begin]).to eq(entry_station)
    end

  end

  describe '#finish' do

    it 'finish adds an exit station to the log' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.current_journey[:end]).to eq(exit_station)
    end

    it 'adds the complete journey to journeys' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to eq([{:begin => entry_station, :end => exit_station}])
    end
  end


end
