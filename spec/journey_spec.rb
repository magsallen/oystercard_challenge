require 'journey'
describe Journey do
   it {is_expected.to respond_to :start}
   it {is_expected.to respond_to :finish}
   it {is_expected.to respond_to :fare}
   it {is_expected.to respond_to :complete?}
   it {is_expected.to respond_to :journey_log}

   it "should be complete" do
    expect(subject).to be_complete
  end
  #
  # describe '#{start}' do
  #   it "start sets compltete to false" do
  #     expect(subject).not_to be_complete
  #   end
  #   end


  it 'start adds an entry station to the log' do
    subject.start(entry_station)
    expect(journey_log[:begin]).to eq(entry_station)
  end
  #
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
