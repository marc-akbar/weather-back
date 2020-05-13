require 'rails_helper'

RSpec.describe "Location search", type: :request do
  it "gets weather data from API and returns current weather" do
    get search_path, :params => { location: 'Paris' }

    binding.pry

    # Double check responses
    expect(response['timezone']).to include("Paris")
    expect(response['currently']['time']).to eq(Time.now)
  end
end
