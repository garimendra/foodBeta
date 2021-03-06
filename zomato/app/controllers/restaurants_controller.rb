class RestaurantsController < ApplicationController
	before_action :find_rest ,only: [:show,:edit,:set_session,:update,:destroy]
# functions for basic crud
	def index
		@cus=params[:cus_sel]
		@region=params[:area_sel]
		if (!@cus.present?&&!@region.present?)
    	flash[:notice]="Please select atleast one"
    	redirect_to :root
    else
    	flash.now[:notice]="Dine in anyone below"
  	end
  	
		if @region.present?&&@cus.present?
			@rest=Restaurant.where(region:@region).where(cuisine:@cus)
		elsif @region.present?
			@rest=Restaurant.where(region:@region)
		else
			@rest=Restaurant.where(cuisine:@cus)
		end
	end

	def show
		@cus=Restaurant.find(params[:id]).cuisine
		@menu=Menu.where(cuisine:@cus)
		@current_rest=Restaurant.find(params[:id])
		@rest_id=params[:id]
	end

	def edit
	end

	def update
	end

	def destroy
	end

# The main page
	def home
		@region=Restaurant.uniq.pluck(:region)
		@cus=Restaurant.uniq.pluck(:cuisine)
	end

# For storing view vars
	def set_session
	end
	
	private

	def rest_params
		params.require(:Restaurant).permit(:name,:accomodation,:timings,:contactnum,:region,:address,:cost,:cuisine,reviews_attributes: [:comments,:rating])
	end

	def find_rest
		@rest=Restaurant.find(params[:id])
	end
end
