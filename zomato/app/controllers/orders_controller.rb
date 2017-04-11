class OrdersController < ApplicationController


	before_action :find_order ,only: [:show,:edit,:update,:destroy]

=begin

	def index 
		@orders = Order.all
	end
=end

	def new
	end

	def edit 
	end

	def show
	end

	def create

	end

	def destroy
	end

	private

	def order_params
		params.require(:Order).permit(:name,:contact,:address,:cost,:orderDetails)
	end

	def find_order
		@order=current_restaurant.orders.find(params[:id])
	end


end
