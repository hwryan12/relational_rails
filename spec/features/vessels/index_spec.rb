require 'rails_helper'

RSpec.describe "Vessel Index Page", type: :feature do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
    @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
    @gq = @pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)
  end

  describe "As a visitor when I visit '/vessels'" do
    it "I see each Child in the system including the Child's attributes" do
      visit "/vessels"

      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
    end

    it "I see a link at the top of the page that takes me to the Vessel Index" do
      visit "/vessels"
      
      expect(page).to have_content("Click here for Vessels")

      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a link at the top of the page that takes me to the Company Index" do
      visit "/vessels"
      
      expect(page).to have_content("Click here for Companies")

      click_on "Click here for Companies"

      expect(current_path).to eq("/companies")
    end

    it "I only see records where the boolean column is `true`" do
      visit "/vessels"
      
      expect(page).to have_content(@ke.name)
      expect(page).to have_content(@ke.year_built)
      expect(page).to have_content(@ke.operational)
      expect(page).to have_no_content(@gq.name)
      expect(page).to have_no_content(@gq.year_built)
      expect(page).to have_no_content(@gq.operational)
    end

    it "Next to every vessel, I see a link to edit that vessel's info, when I click the link
      I should be taken to Vessels edit page where I can update its information" do
      visit "/vessels"
      
      expect(page).to have_button("Edit #{@ke.name}")
      
      click_button "Edit #{@ke.name}"
      
      expect(current_path).to eq("/vessels/#{@ke.id}/edit")
    end

    it "Next to every Vessel, I see a link to delete that Vessel, when I click the link
      I am returned to the Vessel Index Page where I no longer see that Vessel" do
      visit "/vessels"
      
      expect(page).to have_button("Delete #{@ke.name}")

      click_button "Delete #{@ke.name}"

      expect(current_path).to eq("/vessels")
      expect(page).to have_no_content(@ke.name)
      expect(page).to have_no_content(@ke.year_built)
      expect(page).to have_no_content(@ke.operational)
    end

    it "Every Vessel name is rendered to be a link to that Vessel's show page" do
      visit "/vessels"
      click_on "#{@ke.name}"

      expect(current_path).to eq("/vessels/#{@ke.id}")
    end
  end
end