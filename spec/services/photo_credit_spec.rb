require 'rails_helper'

RSpec.describe PhotoCredit do
  describe "Photographer Lookup" do\
    it "given the scene returns the photographer name and page link" do
      photographer = PhotoCredit.find_photographers_by_scene('cloudy')

      expect(photographer[0]).to eq "Toimetaja Tõlkebüroo"
      expect(photographer[1]).to eq "https://unsplash.com/@toimetaja"
    end

    it "handles image without photo credit gracefully" do
      photographer = PhotoCredit.find_photographers_by_scene('crappy')

      expect(photographer).to eq nil
    end
  end
end
