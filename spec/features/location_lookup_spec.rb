require 'rails_helper'

describe "User can see a location search form" do

  before { visit root_path }

  it "allows a user to fill in their location" do
    fill_in 'location', with: "Boulder, CO\n"

    expect(current_path).to eq '/'
  end
end
