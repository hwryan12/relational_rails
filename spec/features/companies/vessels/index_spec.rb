require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  describe "As a visitor when I visit '/companies/:id/vessels'" do
    it "I see each Vessel that is associated with that Company with each Vessel's attributes" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

      visit "/companies/#{@pct.id}/vessels"
      # binding.pry
      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
      expect(page).to have_content(@gq.name)
      expect(page).to have_content(@gq.year_built)
      expect(page).to have_content(@gq.operational)
    end
  end
end