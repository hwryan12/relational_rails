require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'instance methods' do
    describe "#most_recent" do
      it "returns the companies in descending order of creation" do
        pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)
       
        expect(Company.most_recent).to eq([pct, mmt])
      end
    end
    
    describe "#vessel_count" do
      it "returns the amount of vessels per company" do
        pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        ke = pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
        gq = pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

        expect(pct.vessel_count).to eq(2)
      end
    end

    describe "#vessel_built_after" do
      it "Returns the vessels built after an inputted year" do
        pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        ke = pct.vessels.create!(name: 'Klondike Express', year_built: 1999, operational: true)
        gq = pct.vessels.create!(name: 'Glaicer Quest', year_built: 1987, operational: false)

        expect(pct.vessel_built_after(1990)).to eq([ke])
      end
    end
  end
end