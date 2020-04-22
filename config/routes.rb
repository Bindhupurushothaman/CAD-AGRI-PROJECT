
Rails.application.routes.default_url_options[:host] = "intense-beyond-19681.herokuapp.com"

Rails.application.routes.draw do
  resources :farmers
	root to: 'home#page'
  resources :products
  resources :bill_items
  resource :baskets, only: [:show]
  devise_for :users 
resources :searches
resources :profiles
  get 'cuisine', to: 'cuisine#index'
  get 'search', to: 'cuisine#search'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
end