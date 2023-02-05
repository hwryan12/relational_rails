require 'rails_helper'

RSpec.describe "Company Show Page", type: :feature do
  describe "As a visitor when I visit '/companies/:id'" do
    it "I see the Company with that id including the Company's attributes" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

      visit "/companies/#{@pct.id}"
      
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
      
      expect(page).to have_content("Current Amount of Vessels: #{@vessel_count}")
    end

    it "I see a link at the top of the page that takes me to the Vessel Index" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}"
      
      expect(page).to have_content("Click here for Vessels")

      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a link at the top of the page that takes me to the Company Index" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}"
      
      expect(page).to have_content("Click here for Companies")

      click_on "Click here for Companies"

      expect(current_path).to eq("/companies")
    end

    it "I see a link to take me to that Companies' Vessels page" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}"
      
      expect(page).to have_content("Click here for this Companies Vessels")

      click_on "Click here for this Companies Vessels"

      expect(current_path).to eq("/companies/#{@pct.id}/vessels")
    end

    it "I see a link to delete the Company, when I click the link 
      a 'DELETE' request is sent to '/companies/:id'" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}"
      
      expect(page).to have_content("DELETE")

      click_on "DELETE"

      expect(current_path).to eq("/companies")
    end

    it "The Company is deleted, and all vessel records are deleted and 
      I am redirected to the Company index page where I no longer see this Company" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
      @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
      
      visit "/companies/#{@pct.id}"
      click_on "DELETE"

      expect(page).to have_no_content(@pct.name)
      expect(page).to have_no_content(@pct.tripadvisor_rank)
      expect(page).to have_no_content(@pct.offering_cruises)
    end
  end
end