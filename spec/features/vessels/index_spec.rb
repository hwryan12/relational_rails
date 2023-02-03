require 'rails_helper'

RSpec.describe "Vessel Index Page", type: :feature do
  describe "As a visitor when I visit '/vessels'" do
    it "I see each Child in the system including the Child's attributes" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

      visit "/vessels"

      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
      expect(page).to have_content(@gq.name)
      expect(page).to have_content(@gq.year_built)
      expect(page).to have_content(@gq.operational)
    end

    it "I see a link at the top of the page that takes me to the Vessel Index" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)

      visit "/vessels"
      
      expect(page).to have_content("Click here for Vessels")

      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end
  end
end