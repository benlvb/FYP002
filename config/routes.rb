Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  root 'requests#index'

  resources :requests do
  	member do
  		get "like", to: "requests#upvote"
  		get "dislike", to: "requests#downvote"
  	end
  	resources :comments
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/panel', to: 'pages#panel'

end
