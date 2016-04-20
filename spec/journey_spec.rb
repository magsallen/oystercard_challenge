require 'journey'
describe Journey do
 it {is_expected.to respond_to :start}
 it {is_expected.to respond_to :finish}
 it {is_expected.to respond_to :fare}
 it {is_expected.to respond_to :complete?}

 it "should be complete" do
  expect(subject).to be_complete
end

it "start sets compltete to false" do
  subject.start
  expect(subject).not_to be_complete
end

it "finish sets compltete to true" do
  subject.start
  subject.finish
  expect(subject).to be_complete
end

end

# describe '#initialize' do
#   it "starts as complete " do
#   expect(subject.complete?).to eq true
# end
# end

# describe '#start' do

# end
