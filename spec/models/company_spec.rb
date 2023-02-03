require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'instance methods' do
    describe "#most_recent" do
      it "returns the companies in descending order of creation" do
        pct = Company.create!(name: 'Phillips Cruises and Tours', tripadvisor_rank: 1, offering_cruises: true)
        mmt = Company.create!(name: 'Major Marine Tours', tripadvisor_rank: 2, offering_cruises: false)
        # binding.pry
        expect(Company.most_recent).to eq([pct, mmt])
      end
    end
  end
end