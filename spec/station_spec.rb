require 'station'
describe Station do
  # describe "#initialize('station_name')" do
  station = Station.new("station", 1)
    it "starts with a name" do
      expect(station.name).to eq("station")
    end
    it "starts with a zone" do
      expect(station.zone).to eq 1
    end
end
