require 'rails_helper'

describe "Location search" do

  before { visit root_path }

  it "allows a user to look up their location and redirect to root" do
    fill_in 'location', with: "Boulder, CO\n"

    expect(current_path).to eq '/'
  end

  it "returns weather data for the location" do
    
  end
end
