require 'rails_helper'

RSpec.describe "Company New Page", type: :feature do
  describe "As a visitor when I visit the Company New page" do
    it "I see a form for a new Company record" do
      visit "/companies/new"

      expect(page).to have_content("New Company")
    end

    it "When I fill out that form, I am returned to Company Index Page" do
      visit "/companies/new"
      fill_in 'Name', with: 'Allen Marine Tours'
      fill_in 'tripadvisor_rank', with: '3'
      have_select 'offering_cruises', selected: 'true'
      click_on 'Create Company'

      expect(current_path).to eq('/companies')
    end
  end
end