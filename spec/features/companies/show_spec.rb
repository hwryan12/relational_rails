require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  describe "As a visitor when I visit '/companies/:id'" do
    it "I see the Company with that id including the Company's attributes" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

      visit "/companies/#{@pct.id}"
      # binding.pry
      expect(page).to have_content(@pct.name)
      expect(page).to have_content(@pct.tripadvisor_rank)
      expect(page).to have_content(@pct.offering_cruises)
      expect(page).to have_no_content(@mmt.name)
      expect(page).to have_no_content(@mmt.tripadvisor_rank)
      expect(page).to have_no_content(@mmt.offering_cruises)
    end

    it "I see a count of the number of Vessels associated with this Company" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

      visit "/companies/#{@pct.id}"
      
      expect(page).to have_content("Amount of Vessels: #{@vessel_count}")
    end
  end
end