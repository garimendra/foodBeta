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

  resources :orders, except: [:new]
  get '/user/orders', to: 'orders#userorder'
  get '/restaurants/:id/orders', to: 'orders#restorder', as: :restorder
  get 'restaurants/:id/orders/new', to: 'orders#new', as: :orderadd

  root "restaurants#home"
  
end
