require 'rails_helper'

RSpec.describe Weather::Cleaner do
  context "Prepare weather data" do

    let(:response) {
      {
        "time"                 => 1589411821,
        "summary"              => "Partly Cloudy",
        "icon"                 => "partly-cloudy-day",
        "nearestStormDistance" => 1,
        "nearestStormBearing"  => 5,
        "precipIntensity"      => 0,
        "precipProbability"    => 0,
        "temperature"          => 74.77,
        "apparentTemperature"  => 74.77,
        "dewPoint"             => 23.56,
        "humidity"             => 0.15,
        "pressure"             => 1000.9,
        "windSpeed"            => 3.48,
        "windGust"             => 6.03,
        "windBearing"          => 286,
        "cloudCover"           => 0.44,
        "uvIndex"              => 2,
        "visibility"           => 10,
        "ozone"                => 344.4
      }
    }


    describe ".parse_attributes" do
      it "should keep only the designated attributes from the hash" do
        result = Weather::Cleaner.parse_attributes(response)

        expect(result).to include 'temperature'
        expect(result).to include 'humidity'
        expect(result).to include 'uvIndex'

        expect(result).to_not include 'precipIntensity'
        expect(result).to_not include 'ozone'
      end
    end

    describe ".add_suffixes" do
      it "should add the appropriate suffixes to the values" do
        raw_attributes = Weather::Cleaner.parse_attributes(response)
        result = Weather::Cleaner.add_suffixes(raw_attributes)

        expect(result).to include "temperature" => "74.77°"
        expect(result).to include "humidity" => "15%"
      end
    end
  end
end
