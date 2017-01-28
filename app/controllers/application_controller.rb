class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #by including the module into the base class of all controllers (the Application controller), 
  #we arrange to make them available in our controllers as well 
  
  #to make these methods also available in at the views, just say that they are helper methods
  helper_method :current_user, :logged_in?
  
   def current_user
     current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
  
   def logged_in?
     #to make a boolean value just add two ! in front of the var
     !!current_user
   end

   def require_user 
      if !logged_in?
         flash[:danger] = "Please log in first."
         redirect_to "/login"
      end
   end
   
  
end
