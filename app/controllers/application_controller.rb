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
      else
         # if @article, because i am using this same function to user also. 
         #At users, i dont have @article variable, will raise error
         if @article && current_user != @article.user && !current_user.admin?
            #I have @article because there is another before_action that sets all @article 
            flash[:danger] = "You can edit/delete only your own articles!"
            redirect_to root_path
         else
            # if @user, because i am using this same function to article also. 
            # At articles, i dont have @user variable, will raise error
            if @user && current_user != @user && !current_user.admin?
               #I have @article because there is another before_action that sets all @article
               flash[:danger] = "You can edit/delete only your own profile!"
               redirect_to root_path
            end
         end
      end
   end
   
   def require_admin
      if !logged_in? || (logged_in? && !current_user.admin?)
         flash[:danger] = "Only admin have permission!"
         redirect_to categories_path
      else
         
      end
   end
   
end
