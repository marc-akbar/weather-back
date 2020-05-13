require 'rails_helper'

RSpec.describe "Weather search", type: :request do
  it "gets weather data from API and returns current weather" do
    get search_path, :params => { location: 'Boulder, CO' }

    binding.pry

    expect(response.body).to include("America/Denver")
  end
end
