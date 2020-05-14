require 'rails_helper'

describe "Location search" do

  before { visit root_path }

  it "allows a user to look up their location and redirect to root" do
    fill_in 'location', with: "Boulder, CO\n"

    expect(current_path).to include '/search'
  end

  it "returns weather data for the location" do
    fill_in 'location', with: "Boulder, CO\n"

    expect(page).to have_content "Current Temperature"
    expect(page).to have_content "Boulder"
  end

  it "raises an error when query returns nil" do
    fill_in 'location', with: ""

    expect(current_path).to eq root_path
    expect(page).to have_content "Location not found"
  end
end
