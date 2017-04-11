class Fixtypecolumn < ActiveRecord::Migration[5.0]
  def change
  	    rename_column :menus, :type, :category
  end
end
