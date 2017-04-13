class OrdersController < ApplicationController


	before_action :find_order ,only: [:show,:edit,:update,:destroy]

	def index 
	end


	def new
		@order = current_user.orders.build
		@rest = Restaurant.find(params[:id])
		@restid=Restaurant.find(params[:id]).id
		@menu = Menu.where(cuisine: @rest.cuisine)
	end

	def edit 
	end

	def show
	end

	def create
		@order= current_user.orders.build(order_params)
		@order.user_id=current_user.id
		if @order.save
			redirect_to :controller => 'restaurants',:action=> 'show',:id=>params[:restaurant_id]
			flash[:success]="Thank you for placing your order"
		else
			render 'new'
		end
	end

	def destroy
		@ords=Order.find(params[:id])
		@ords.destroy
		redirect_to user_orders_path
	end

	def userorder
		@order = current_user.orders
		@reqrests ||=[]
		@order.each do |ord|
			(@reqrests ||=[]) << Restaurant.find(ord.restaurant_id).name
		end
		@fin=@order.zip(@reqrests)
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
		params.permit(:address,:restaurant_id,:name,:contact,:cost,:orderDeatils)
	end

	def find_order
		@rest = Restaurant.find(params[:id])
		@order=@rest.orders
	end


end