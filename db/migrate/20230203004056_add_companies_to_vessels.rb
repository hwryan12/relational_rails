class AddCompaniesToVessels < ActiveRecord::Migration[5.2]
  def change
    add_reference :vessels, :company, foreign_key: true
  end
end
