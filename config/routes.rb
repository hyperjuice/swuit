Rails.application.routes.draw do

  get '/map' => 'map#index'
  get '/mapdata' => 'map#map'

  devise_for :users, controllers: { sessions: "users/sessions" }


  resources :users do
    resources :products
  end


  root 'welcome#index'
end