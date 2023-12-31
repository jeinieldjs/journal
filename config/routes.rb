Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'  
   
  end

  resources :categories do
    resources :tasks do
    end
  end



  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'dashboard#index'
  get 'dashboard/index'


  # Defines the root path route ("/")
  # root "posts#index"
end
