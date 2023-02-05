require 'rails_helper'

RSpec.describe "Company Index Page", type: :feature do
  describe "As a visitor when I visit '/parents'" do
    it "I see the name of each parent record in the system" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

      visit "/companies"

      expect(page).to have_content(@pct.name)
      expect(page).to have_content(@mmt.name)
    end

    it "I see the created timestamp next to the company" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)

      visit "/companies"

      expect(page).to have_content(@pct.created_at)
      expect(page).to have_content(@mmt.created_at)
    end

    it "I see a link at the top of the page that takes me to the Vessel Index" do
      visit "/companies"
      
      expect(page).to have_content("Click here for Vessels")

      click_on "Click here for Vessels"

      expect(current_path).to eq("/vessels")
    end

    it "I see a link at the top of the page that takes me to the Company Index" do
      visit "/companies"
      
      expect(page).to have_content("Click here for Companies")

      click_on "Click here for Companies"

      expect(current_path).to eq("/companies")
    end

    it "I see a link to create a new Company record, 'New Company' that takes me to '/companies/new'" do
      visit "/companies"
      
      expect(page).to have_content("New Company")

      click_on "New Company"

      expect(current_path).to eq("/companies/new")
    end
    
    it "Next to every Company, I see a link to edit that Companies' info When I click the link
      I should be taken to that Companies' edit page where I can update its information" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
      
      visit "/companies"
      
      expect(page).to have_content("Edit Company")

      click_on "Edit Company"

      expect(current_path).to eq("/companies/#{@pct.id}/edit")
    end
  end
end