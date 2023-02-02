require 'rails_helper'

RSpec.describe "Comapany Index Page", type: :feature do
  describe "As a visitor when I visit '/parents'" do
    it "I see the name of each parent record in the system" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

      visit "/companies"

      expect(page).to have_content(@pct.name)
      expect(page).to have_content(@mmt.name)
    end
  end
end