Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  root 'requests#index'

  resources :requests do
  	member do
  		get "like", to: "requests#upvote"
  		get "dislike", to: "requests#downvote"
  	end
  	resources :comments
    resources :images
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
