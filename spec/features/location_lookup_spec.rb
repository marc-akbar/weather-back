require 'rails_helper'

describe "User can see a location search form" do

  before { visit root_path }

  it "allows a user to look up a location" do
    fill_in 'location', with: "Boulder, CO\n"

    expect(current_path).to be '/weather'
  end
end
