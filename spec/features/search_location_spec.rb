require 'rails_helper'

describe "Location search" do

  before { visit root_path }

  it "allows a user to look up their location" do
    fill_in 'location', with: "Boulder, CO"
    click_on 'Search'

    expect(current_path).to include '/search'
  end

  it "raises an error when query returns nil" do
    fill_in 'location', with: "some fake city"
    click_on 'Search'

    expect(current_path).to eq root_path
    expect(page).to have_content "Location not found"
  end
end
