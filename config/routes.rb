Rails.application.routes.draw do

	root 'realestates#index'
	
  resources :realestates
  delete '/realestates/:realestate_id/pictures/:id', to: 'pictures#destroy', as: :destroy_realestate_picture
  devise_for :users

	get '/admin', to: 'realestates#admin', as: :admin

	get '/companies', to: 'company#index', as: :companies
	post '/companies', to: 'company#create'
	get '/company/new', to: 'company#new', as: :new_company
	get '/company/:id/edit', to: 'company#edit', as: :edit_company
	get 'company/:id', to: 'company#show', as: :company
	patch '/company/:id', to: 'company#update', as: :patch_company
	put '/company/:id', to: 'company#update', as: :put_company

	get '/contact', to: 'messages#new', as: :contact
	post 'contact', to: 'messages#create'
end
