require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
    @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
    @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
  end

  describe "As a visitor when I visit '/companies/:id/vessels'" do
    it "I see each Vessel that is associated with that Company with each Vessel's attributes" do
      visit "/companies/#{@pct.id}/vessels"

      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
      expect(page).to have_content(@gq.name)
      expect(page).to have_content(@gq.year_built)
      expect(page).to have_content(@gq.operational)
    end

    it "I see a link at the top of the page" do  
      visit "/companies/#{@pct.id}/vessels"
      
      expect(page).to have_content("Click here for Vessels")
    end

    it "That link takes me to the Vessel Index" do  
      visit "/companies/#{@pct.id}/vessels"
      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a link at the top of the page" do
     visit "/companies/#{@pct.id}/vessels"
      
      expect(page).to have_content("Click here for Companies")
    end
    
    it "That link takes me to the Company Index" do
      visit "/companies/#{@pct.id}/vessels"
      click_on "Click here for Companies"
 
      expect(current_path).to eq("/companies")
    end

    it "I see a link to sort children in alphabetical order" do 
      visit "/companies/#{@pct.id}/vessels"

      expect(page).to have_content("List Vessels Alphabetically")
    end

    it "When I click on the link I'm taken back to the Companies' Vessels Index Page 
      where I see all of the Companies' Vessels in alphabetical order" do
      visit "/companies/#{@pct.id}/vessels"
      click_on "List Vessels Alphabetically"

      expect(current_path).to eq("/companies/#{@pct.id}/vessels")
      expect(@gq.name).to appear_before(@ke.name)
    end

    it "Next to every vessel, I see a link to edit that vessel's info" do   
      visit "/companies/#{@pct.id}/vessels"
      
      expect(page).to have_button("Edit #{@ke.name}")
    end

    it "When I click the link I should be taken to Vessels edit page where I can update its information" do   
      visit "/companies/#{@pct.id}/vessels"
      click_button "Edit #{@ke.name}"
      
      expect(current_path).to eq("/vessels/#{@ke.id}/edit")
    end

    it "I see a form that allows me to input a number value" do
      visit "/companies/#{@pct.id}/vessels"

      expect(page).to have_content("Year Built:")
    end

    it "I see a form that allows me to input a number value and returns back 
      to the current index page with only the records that meet that threshold shown" do
      visit "/companies/#{@pct.id}/vessels"
      fill_in "Year Built:", with: "1990"
      click_button 'Only return records younger than this built year for vessels'
      
      expect(current_path).to eq("/companies/#{@pct.id}/vessels")
    end

    it "Next to every Vessel, I see a link to delete that Vessel" do 
      visit "/companies/#{@pct.id}/vessels"
      
      expect(page).to have_button("Delete #{@ke.name}")
    end

    it "When I click the link I am returned to the Vessel Index Page where I no longer see that Vessel" do 
      visit "/companies/#{@pct.id}/vessels"
      click_button "Delete #{@ke.name}"

      expect(current_path).to eq("/vessels")
      expect(page).to have_no_content(@ke.name)
      expect(page).to have_no_content(@ke.year_built)
      expect(page).to have_no_content(@ke.operational)
    end
  end
end