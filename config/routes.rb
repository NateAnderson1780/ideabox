Rails.application.routes.draw do
  root to: "users#dashboard"
  
  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace :admin do
    root to: "admin#index"
    resources :ideas 
  end
  
  namespace :admin do 
    resources :images 
  end
  
  namespace :admin do
    resources :categories 
  end
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
