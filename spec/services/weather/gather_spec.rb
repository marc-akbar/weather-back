require 'rails_helper'

RSpec.describe Weather::Gather do
  describe "Send API Request" do

    let(:location)  { "Boulder, CO" }

    it "returns weather day given location" do
      response = Weather::Gather.get_current_weather_by_location(location)
      expect(response["timezone"]).to eq "America/Denver"
    end
  end
end
