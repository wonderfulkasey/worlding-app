Rails.application.routes.draw do
  #resources :characters 
  #resources :plots
  resources :worlds do 
    resources :characters
   #resources :plots
  end

  resources :worlds do
    resources :plots
  end

  resources :characters 
  resources :plots

  root 'application#home'
 
  #nested show url
  #get 'worlds/:world_id/characters/:character_id'       
  #get 'worlds/:world_id/plots/:plot_id' 
        

  #nested new url
  #get 'worlds/:world_id/characters/new' 
  #get 'worlds/:world_id/plots/new' 
        
  #form display with validations
  #in view folder world, under form
  
  #custom active record scope 
  #view worlds by most plots in world
  get 'worlds/most-plots' => 'worlds#show'

  devise_for :users, :controllers => { registrations: "registrations",
     omniauth_callbacks: "callbacks"}

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do 
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
 
end
