require 'rails_helper'

RSpec.describe "Company Show Page", type: :feature do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
  end

  describe "As a visitor when I visit '/companies/:id'" do
    it "I see a link 'Update Phillips Cruises and Tours'" do
      visit "/companies/#{@pct.id}"
      
      expect(page).to have_button("Update #{@pct.name}")
    end

    it "When I click the link 'Update Phillips Cruises and Tours', I am taken to '/parents/:id/edit' 
      where I see a form to edit the parent's attributes" do
      visit "/companies/#{@pct.id}"      
      click_button "Update #{@pct.name}"

      expect(current_path).to eq("/companies/#{@pct.id}/edit")
    end

    describe "When update form is filled and submitted a `PATCH` request is sent to '/companies/:id'" do
      it "The companies' info is updated,and I am redirected to the Companies' Show page 
        where I see the Companies' updated info" do
        visit "/companies/#{@pct.id}"
        click_on "Update #{@pct.name}"
        fill_in 'Name', with: 'Allen Marine Tours'
        fill_in 'tripadvisor_rank', with: '3'
        have_select 'offering_cruises', selected: 'true'
        click_on "Update"

        expect(current_path).to eq("/companies/#{@pct.id}")
        expect(page).to have_content("Allen Marine Tours")
        expect(page).to have_content("3")
        expect(page).to have_content("true")
      end
    end
  end
end