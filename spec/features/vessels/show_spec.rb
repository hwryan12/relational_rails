require 'rails_helper'

RSpec.describe "Vessel Index Page", type: :feature do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
    @ke = @pct.vessels.create!(name: 'Klondike Express', length: 137, year_built: 1999, operational: true)
    @gq = @pct.vessels.create!(name: 'Glaicer Quest', length: 97, year_built: 1987, operational: false)
  end

  describe "As a visitor when I visit '/parents/:id'" do
    it "I see the parent with that id including the parent's attributes" do
      visit "/vessels/#{@ke.id}"
  
      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.length)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
      expect(page).to have_no_content(@gq.name)
      expect(page).to have_no_content(@gq.length)
      expect(page).to have_no_content(@gq.year_built)
      expect(page).to have_no_content(@gq.operational)
    end

    it "I see a Vessel Index link at the top of the page" do
      visit "/vessels/#{@ke.id}"
      
      expect(page).to have_content("Click here for Vessels")
    end

    it "That link takes me to the Vessel Index" do
      visit "/vessels/#{@ke.id}"
      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a Company Index link at the top of the page" do
      visit "/vessels/#{@ke.id}"
      
      expect(page).to have_content("Click here for Companies")
    end

    it "That link takes me to the Company Index" do
      visit "/vessels/#{@ke.id}"
      click_on "Click here for Companies"

      expect(current_path).to eq("/companies")
    end

    it "I see a link to delete the vessel" do
      visit "/vessels/#{@ke.id}"
      
      expect(page).to have_button("Delete #{@ke.name}")
    end

    it "When I click the link then a 'DELETE' request is sent to '/child_table_name/:id'" do
      visit "/vessels/#{@ke.id}"
      click_button "Delete #{@ke.name}"

      expect(current_path).to eq("/vessels")
    end

    it "When the Vessel is deleted I am redirected to the Vessel index page 
      where I no longer see this Vessel" do
      visit "/vessels/#{@ke.id}"
      click_on "Delete #{@ke.name}"

      expect(page).to have_no_content(@ke.name)
      expect(page).to have_no_content(@ke.length)
      expect(page).to have_no_content(@ke.year_built)
      expect(page).to have_no_content(@ke.operational)
    end
  end
end