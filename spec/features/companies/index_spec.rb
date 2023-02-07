require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  before(:each) do 
    @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
  end
  
  describe "As a visitor when I visit '/parents'" do
    it "I see the name of each parent record in the system" do
      visit "/companies"

      expect(page).to have_content(@pct.name)
    end

    it "I see the created timestamp next to the company" do
      visit "/companies"

      expect(page).to have_content(@pct.created_at)
    end

    it "I see a Vessel Index link at the top of the page" do
      visit "/companies"
      
      expect(page).to have_content("Click here for Vessels")
    end

    it "That link takes me to the Vessel Index" do
      visit "/companies"
      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a Company Index link at the top of the page" do
      visit "/companies"
      
      expect(page).to have_content("Click here for Companies")
    end

    it "That link takes me to the Company Index" do
      visit "/companies"
      click_on "Click here for Companies"

      expect(current_path).to eq("/companies")
    end

    it "I see a link 'New Company' to create a new Company record" do
      visit "/companies"
      
      expect(page).to have_button("New Company")
    end

    it "That link takes me to '/companies/new'" do
       visit "/companies"
       click_button "New Company"

      expect(current_path).to eq("/companies/new")
    end
    
    it "Next to every Company, I see a link to edit that Companies' info" do 
      visit "/companies"
      
      expect(page).to have_button("Edit #{@pct.name}")
    end

    it "When I click the link I should be taken to that Companies' edit page where I can update its information" do 
      visit "/companies"
      click_button "Edit #{@pct.name}"

      expect(current_path).to eq("/companies/#{@pct.id}/edit")
    end

    it "Next to every Company, I see a link to delete that Company" do
      visit "/companies"
      
      expect(page).to have_button("Delete #{@pct.name}")
    end

    it "When I click the link I am returned to the Parent Index Page where I no longer see that parent" do
      visit "/companies"
      click_button "Delete #{@pct.name}"

      expect(current_path).to eq("/companies")
      expect(page).to have_no_content(@pct.name)
    end

    it "Every Company name is rendered to be a link to that Companies' show page" do      
      visit "/companies"
      click_on "#{@pct.name}"

      expect(current_path).to eq("/companies/#{@pct.id}")
    end

    it "I see a text box to filter results by keyword" do
      visit "/companies"

      expect(page).to have_button("Search")
    end

    it "I type in a keyword that is an exact match of one or more of my records and press the Search button" do
      visit "/companies"
      click_button "Search"

      expect(current_path).to eq("/companies")
    end

    it "I only see records that are an exact match returned on the page" do 
      visit "/companies"
      fill_in 'Search', with: 'Phillips Cruises and Tours'
      click_button "Search"
      
      expect(page).to have_content(@pct.name)
      expect(page).to have_no_content(@mmt.name)
    end
  end
end