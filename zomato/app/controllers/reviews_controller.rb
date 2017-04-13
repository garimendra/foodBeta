class ReviewsController < ApplicationController
	before_action :find_rev, only:[:show,:edit,:update,:destroy]
	before_action :authenticate_user!, except: [:index, :show,:restrev]
	def index
	end

	def show
		redirect_to :controller => 'restaurants',:action=> 'show',:id=>session[:temp]
	end

	def new
		@rev= current_user.reviews.build
		@restid=params[:id]
	end

	def create
		@rev= current_user.reviews.build(rev_params)
		@rev.user_id=current_user.id
		session[:temp]=@rev.restaurant_id
		if @rev.save
			redirect_to @rev, notice: "Thank you for your reviews"
		else
			render 'new'
		end
	end

	def edit
		@restid=@rev.restaurant_id
	end

	def update
		if @rev.update(rev_params)
			flash[:success]= "Review updated"
			redirect_to user_reviews_path
		else
			render 'edit'
		end
	end

	def destroy
		@rev.destroy
		redirect_to user_reviews_path
	end

	def userrev
		@reqrests ||=[]
		@rev=current_user.reviews;
		@rev.each do |rev|
			(@reqrests ||=[]) << Restaurant.find(rev.restaurant_id).name
		end
		@fin=@rev.zip(@reqrests)
		render 'userrev'
	end

	def restrev
		@rest=Restaurant.find(params[:id])
		@rev=@rest.reviews
		@requser ||=[]
		@rev.each do |rev|
			(@requser ||=[]) << User.find(rev.user_id).email
		end
		@fin=@rev.zip(@requser)
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
