class ConnectReviews < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reviews, :user, foreign_key:true
  	 add_reference :reviews, :restaurant, foreign_key:true
  end
end
