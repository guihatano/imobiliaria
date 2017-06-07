Rails.application.routes.draw do

	root 'realestates#index'
	
  resources :realestates
  devise_for :users
end
