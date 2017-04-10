class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :accomodation
      t.text :timings
      t.string :contactnum
      t.string :region
      t.text :address
      t.integer :cost

      t.timestamps
    end
  end
end
