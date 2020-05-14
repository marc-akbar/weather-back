require 'rails_helper'

RSpec.describe Weather::DataGather do
  describe "Send API Request" do

    let(:lat)       { 40.014984 }
    let(:long)      { -105.270546 }
    let(:location)  { "Boulder, CO" }

    it "returns weather day given lat and long" do
      response = Weather::DataGather.get_current_weather_by_lat_long(lat, long)
      expect(response["timezone"]).to eq "America/Denver"
    end

    it "returns weather day given location" do
      response = Weather::DataGather.get_current_weather_by_location(location)
      expect(response["timezone"]).to eq "America/Denver"
    end

    it "handles poorly formatted requests gracefully" do
      bad_response = Weather::DataGather.get_current_weather_by_lat_long("23.2.2", long)
      expect(bad_response["code"]).to eq 400
    end
  end
end
