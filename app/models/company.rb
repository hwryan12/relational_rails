class Company < ApplicationRecord
  has_many :vessels

  def self.most_recent
    Company.order(:created_at)
  end

  def vessel_count
    self.vessels.count
  end

  def vessel_length(length)
    self.vessels.where("length > #{length}")
  end
end