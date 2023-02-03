class Company < ApplicationRecord
  has_many :vessels

  def self.most_recent
    Company.order(:created_at)
  end
end