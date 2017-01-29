class UsersController < ApplicationController
   
   before_action :set_user, only: [:edit, :update, :show]
   before_action :require_user, only: [:edit, :update]
   
   def new
      @user = User.new
   end
   
   def create
      @user = User.new(user_params)
      if @user.save
         flash[:success] = "Welcome to the blog, #{@user.username}"
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         render "new"
      end
   end
   
   def edit 
      # @user = User.find(params[:id])
   end
   
   def update
      # @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "Account successfuly updated!"
         redirect_to articles_path
      else
         #render the edit template again
         render "edit"
      end
   end
   
   def show 
      # @user = User.find(params[:id])
      @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
   end
   
   def index
      # @users = User.all
      @users = User.paginate(page: params[:page],per_page: 5)
   end
   
   #this method gives me all attr from the params
   #for safety, we use this method which will permit
   # only these 3 params 
   private def user_params
      params.require(:user).permit(:username, :email, :password)
   end
   
############################ FUNCTION DEFINITION ############################### 
   def set_user
      return @user = User.find(params[:id])
   end
end