Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
	  collection do
	    get 'set_session'
	  end
	end
  resources :reviews, except: [:new]
  get '/user/reviews', to: 'reviews#userrev'
  get '/restaurants/:id/reviews', to: 'reviews#restrev',as: :restrev
  get 'restaurants/:id/reviews/new', to: 'reviews#new', as: :revadd
  root "restaurants#home"
  
end
