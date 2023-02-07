require 'rails_helper'

RSpec.describe "Vessel Edit Page", type: :feature do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
    @ke = @pct.vessels.create!(name: 'Klondike Express', length: 137, year_built: 1999, operational: true)
    @gq = @pct.vessels.create!(name: 'Glaicer Quest', length: 97, year_built: 1987, operational: false)
  end

  describe "As a visitor when I visit a Child Show page" do
    it "I see a link to update that Child 'Update Klondike Express'" do
      visit "/vessels/#{@ke.id}"
      
      expect(page).to have_button("Update #{@ke.name}")
    end

    it "When I click the link, I am taken to '/vessels/:id/edit'" do
      visit "/vessels/#{@ke.id}"
      click_button "Update #{@ke.name}"

      expect(current_path).to eq("/vessels/#{@ke.id}/edit")
    end

    it "I see a form to edit the Vessel's attributes" do
      visit "/vessels/#{@ke.id}/edit"

      expect(page).to have_field("name")
      expect(page).to have_field("length")
      expect(page).to have_field("year_built")
      expect(page).to have_field("operational")
    end

    it "I click 'Update', a `PATCH` request is sent to '/vessels/:id'" do
      visit "/vessels/#{@ke.id}/edit"
      fill_in 'name', with: 'Bravest'
      fill_in 'length', with: '130'
      fill_in 'year_built', with: '1997'
      have_select 'operational', selected: 'true'
      click_on "Update"

      expect(current_path).to eq("/vessels/#{@ke.id}")
    end

    it "I am redirected to the Child Show page where I see the Child's updated information" do
      visit "/vessels/#{@ke.id}/edit"
      fill_in 'name', with: 'Bravest'
      fill_in 'length', with: '130'
      fill_in 'year_built', with: '1997'
      have_select 'operational', selected: 'true'
      click_on "Update"

      expect(page).to have_content("Bravest")
      expect(page).to have_content("130")
      expect(page).to have_content("1997")
      expect(page).to have_content("true")
    end
  end
end