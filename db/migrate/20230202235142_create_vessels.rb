class CreateVessels < ActiveRecord::Migration[5.2]
  def change
    create_table :vessels do |t|
      t.string :name
      t.integer :year_built
      t.boolean :operation

      t.timestamps
    end
    add_reference :vessels, :companies, foreign_key: true
  end
end
