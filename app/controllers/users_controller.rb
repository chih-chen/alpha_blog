class UsersController < ApplicationController
   
   def new
      @user = User.new
   end
   
   def create
      @user = User.new(user_params)
      if @user.save
         flash[:success] = "Welcome to the blog, #{@user.username}"
         redirect_to articles_path
      else
         render "new"
      end
   end
   
   def edit 
      @user = User.find(params[:id])
   end
   
   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "Account successfuly updated!"
         redirect_to articles_path
      else
         #render the edit template again
         render "edit"
      end
   end
   
   def show 
      @user = User.find(params[:id])
      # @user_articles = Article.find(params[:id])
   end
   
   #this method gives me all attr from the params
   #for safety, we use this method which will permit
   # only these 3 params 
   private
   def user_params
      params.require(:user).permit(:username, :email, :password)
   end
end