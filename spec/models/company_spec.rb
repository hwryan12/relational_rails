require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:each) do 
    @pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
    @mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)
    @ke = @pct.vessels.create!(name: 'Klondike Express', length: 137, year_built: 1999, operational: true)
    @gq = @pct.vessels.create!(name: 'Glaicer Quest', length: 97, year_built: 1987, operational: false)
  end

  describe 'instance methods' do
    describe "#most_recent" do
      it "returns the companies in descending order of creation" do
       
        expect(Company.most_recent).to eq([@pct, @mmt])
      end
    end
    
    describe "#vessel_count" do
      it "returns the amount of vessels per company" do

        expect(@pct.vessel_count).to eq(2)
      end
    end

    describe "#vessel_length" do
      it "Returns the vessels built after an inputted year" do

        expect(@pct.vessel_length(100)).to eq([@ke])
      end
    end
  end

  describe "class methods" do
    describe "#search" do
      it "It searches all names and returns names that exactly match query" do

        expect(Company.search("Phillips Cruises and Tours")).to eq([@pct])
      end
    end
  end
end