class DeletingCuisine < ActiveRecord::Migration[5.0]
  def down
  	drop_table :cuisine
  end
end
