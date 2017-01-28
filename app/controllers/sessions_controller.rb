class SessionsController < ApplicationController
   
   def new 
      
   end 
   
   def create
      #user data is under session
      @user = User.find_by(email: params[:session][:email].downcase)
      # debugger
      if @user && @user.authenticate(params[:session][:password])
         #simulating a loggin. Meaning that the user is logged
         #in the session, add the user id, this will be stored by the cookie in the browser
         session[:user_id] = @user.id
         flash[:success] = "Welcome back, #{@user.username}."
         redirect_to "/users/#{@user.id}"
      else
         #use flash.now, because flash persist until next request and render ins't a request, so...
         # if you use flash, it will persist for 2 pages...
         flash.now[:danger] = "Invalid email/password combination! Please try again."
         render "new"
      end
   end
   
   def destroy
      #simulate loggout
      session[:user_id] = nil
      flash[:info] = "You successfully logged out!"
      redirect_to "/"
   end
   
end