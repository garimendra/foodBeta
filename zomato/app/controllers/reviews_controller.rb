class ReviewsController < ApplicationController
	before_action :find_rev, only:[:show,:edit,:update,:destroy]
	before_action :authenticate_user!, except: [:index, :show,:restrev]
	def index
	end

	def show
	end

	def new
		@rev= current_user.reviews.build
		@restid=params[:id]
	end

	def create
		@rev= current_user.reviews.build(rev_params)
		@rev.user_id=current_user.id
		if @rev.save
			redirect_to @rev, notice: "Thank you for your reviews"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def userrev
		@rev=current_user.reviews;
		render 'userrev'
	end

	def restrev
		@rest=Restaurant.find(params[:id])
		@rev=@rest.reviews
		render 'restrev'
	end

	private

	def rev_params
		params.require(:review).permit(:comments,:rating,:restaurant_id)
	end

	def find_rev
		@rev=Review.find(params[:id])
	end

end
