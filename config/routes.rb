Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #home page        #res.render
#   get("/", to: "page#home")
  #or can simply use:
  root "page#home"
  get("/about",to: "page#about")
end
