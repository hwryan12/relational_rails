require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  describe "As a visitor when I visit '/companies/:id/vessels'" do
    it "I see a link to add a new adoptable Vessel for that Company 'Create Vessel'" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

      visit "/companies/#{@pct.id}/vessels"

      expect(page).to have_button("Create Vessel")
    end

    it "When I click the link, I am taken to '/companies/:company_id/vessesls/new'" do 
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}/vessels"
      click_button "Create Vessel"

      expect(current_path).to eq("/companies/#{@pct.id}/vessels/new")
    end
    
    it "There's a form to add a new Vessel, that is filled out with vessel atrributes can be and submitted
        sending a `POST` request is sent to '/companies/company_id/vessels/name'" do 
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}/vessels"
      click_on "Create Vessel"

      fill_in 'Name', with: 'Bravest'
      fill_in 'year_built', with: '1996'
      have_select 'operational', selected: 'true'
      click_on 'Create'      

      expect(current_path).to eq("/companies/#{@pct.id}/vessels")
    end
  end
end