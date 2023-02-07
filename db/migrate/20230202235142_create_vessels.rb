class CreateVessels < ActiveRecord::Migration[5.2]
  def change
    create_table :vessels do |t|
      t.string :name
      t.integer :length
      t.integer :year_built
      t.boolean :operational

      t.timestamps
    end
  end
end
