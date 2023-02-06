require 'rails_helper'

RSpec.describe "Vessel Edit Page", type: :feature do
  describe "As a visitor when I visit a Child Show page" do
    describe "I see a link to update that Child 'Update Vessel'" do
      it "When I click the link, I am taken to '/vessels/:id/edit'" do
        @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)

        visit "/vessels/#{@ke.id}"
        expect(page).to have_button("Update Vessel")

        click_button "Update Vessel"
        expect(current_path).to eq("/vessels/#{@ke.id}/edit")
      end

      it "I see a form to edit the Vessel's attributes" do
        @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)

        visit "/vessels/#{@ke.id}/edit"

        expect(page).to have_field("name")
        expect(page).to have_field("year_built")
        expect(page).to have_field("operational")
      end

      it "I click 'Update', a `PATCH` request is sent to '/vessels/:id', and I am redirected to 
        the Child Show page where I see the Child's updated information" do
        @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        @ke = @pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)

        visit "/vessels/#{@ke.id}/edit"
        fill_in 'name', with: 'Bravest'
        fill_in 'year_built', with: '1997'
        have_select 'operational', selected: 'true'
        click_on "Update"

        expect(current_path).to eq("/vessels/#{@ke.id}")
        expect(page).to have_content("Bravest")
        expect(page).to have_content("1997")
        expect(page).to have_content("true")
      end
    end
  end
end