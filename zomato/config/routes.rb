Rails.application.routes.draw do
  resources :restaurants do
	  collection do
	    get 'set_session'
	  end
	end
  
  root "restaurants#home"
  
end
