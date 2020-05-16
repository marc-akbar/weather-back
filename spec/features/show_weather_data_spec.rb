require 'rails_helper'

describe "Show weather data and image after lookup" do
   before {
     visit root_path
     fill_in 'location', with: "Paris, France"
     click_on 'Search'
   }

   it "should show weather data for the location" do
     expect(page).to have_content 'Paris, Ile-de-France, France'
     expect(page).to have_content "Summary"
     expect(page).to have_content "Temperature"
     expect(page).to have_content "Dew Point"
     expect(page).to have_content "Pressure"
   end
end
