Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  
  resources :worlds do 
    resources :characters, :plots
  end

  #resources :worlds do
   # resources :plots
  #end

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
  #view world with most plots 
  get 'worlds/most-plots' => 'worlds#show'


  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all


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
