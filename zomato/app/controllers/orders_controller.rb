class OrdersController < ApplicationController


	before_action :find_order ,only: [:show,:edit,:update,:destroy]

	def index 
	end


	def new
		@order = current_user.orders.build
		@orderid = params[:id]
	end

	def edit 
	end

	def show
	end

	def create
		@order= current_user.orders.build(rev_params)
		@order.user_id=current_user.id
		if @order.save
			redirect_to @order, notice: "Thank you for placing your order"
		else
			render 'new'
		end
	end

	def destroy
	end

	def userorder
		@order = current_user.orders
		render 'userorder'
	end

=begin
	def restorder
		@order = Restaurant.find(params[:id]).orders
		render 'restorder'
	end
=end


	private

	def order_params
		params.require(:Order).permit(:name,:contact,:address,:cost,:orderDetails, :restaurant_id)
	end

	def find_order
		@order=current_restaurant.orders.find(params[:id])
	end


end