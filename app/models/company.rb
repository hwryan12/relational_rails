class Company < ApplicationRecord
  has_many :vessels

  def self.most_recent
    Company.order(:created_at)
  end

  def vessel_count
    self.vessels.count
  end

  def vessel_built_after(year)
    self.vessels.where("year_built > #{year}")
  end
end