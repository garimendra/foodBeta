class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :contact
      t.text :address
      t.integer :cost
      t.text :orderDeatils

      t.timestamps
    end
  end
end
