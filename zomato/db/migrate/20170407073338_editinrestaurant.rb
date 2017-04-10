class Editinrestaurant < ActiveRecord::Migration[5.0]
  def up
  	add_column :restaurants,:cuisine,:string
  end
end
