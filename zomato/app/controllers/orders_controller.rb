class OrdersController < ApplicationController


	before_action :find_order ,only: [:show,:edit,:update,:destroy]

	def index 
	end


	def new
		@order = current_user.orders.build
		@rest = Restaurant.find(params[:id])
		@menu = Menu.where(cuisine: @rest.cuisine)
	end

	def edit 
	end

	def show
	end

	def create
		@order= current_user.orders.build(order_params)
		@order.user_id=current_user.id
=begin
	Here fill in these values by calculating from the form at present these will be nill in db if you create any order now
		@order.cost=
		@order.orderDeatils=
=end
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
		params.permit(:address,:restaurant_id,:name,:contact)
	end

	def find_order
		@rest = Restaurant.find(params[:id])
		@order=@rest.orders
	end


end