Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #home page    controller: page / template: home.html.erb
#   get("/", to: "page#home")
  #or can simply use:
  root "pages#home"
  
  get("/about",to: "pages#about")
  
  # resourses: automatically sets the new/edit/destroy path for me !!!!
  #article routes 
  resources :articles
  
  #user routes
  get("/signup", to: "users#new")
  resources :users, except: [:new]
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to:"sessions#destroy"
  
  resources :categories, except: [:destroy]
  
  
  
end
