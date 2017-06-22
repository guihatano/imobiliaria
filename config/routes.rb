Rails.application.routes.draw do

	root 'realestates#index'
	
  resources :realestates
  delete '/realestates/:realestate_id/pictures/:id', to: 'pictures#destroy', as: :destroy_realestate_picture
  devise_for :users

  get '/admin', to: 'realestates#admin', ad: :admin
end
