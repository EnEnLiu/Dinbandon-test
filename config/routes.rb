Rails.application.routes.draw do
  resources :categories
  #根目錄get '/' , to: "welcome#index"
  root "items#index"


  #users
  get '/login' , to: "users#login"
  post '/login', to: "users#sign_in"
  delete '/logout', to: "users#logout"
  get '/sign_up' , to: "users#sign_up"
  post '/sign_up' , to: "users#registration"

  #items
  resources :items do
    resources :comments, only: [:create]
    # /comments/new
    # /comments/create
  end
 # /comments
 # /comments/:id
 # /comments/:id/edit

end
