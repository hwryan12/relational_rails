require 'rails_helper'

RSpec.describe "Company Show Page", type: :feature do
  describe "As a visitor when I visit '/companies/:id'" do
    it "I see a link to update the parent 'Update Company'" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)

      visit "/companies/#{@pct.id}"
      expect(page).to have_content("Update Company")
    end

    it "When I click the link 'Update Parent', I am taken to '/parents/:id/edit' 
        where I see a form to edit the parent's attributes" do
      @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)

      visit "/companies/#{@pct.id}"
      click_on "Update Company"
      expect(current_path).to eq("/companies/#{@pct.id}/edit")
    end

    describe "When update form is filled and submitted a `PATCH` request is sent to '/companies/:id'" do
      it "The companies' info is updated,and I am redirected to the Companies' Show page 
          where I see the Companies' updated info" do
        @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)

        visit "/companies/#{@pct.id}"
        
        click_on "Update Company"
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