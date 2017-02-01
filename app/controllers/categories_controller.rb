class CategoriesController < ApplicationController
   
   before_action :require_admin, only: [:new, :create]
   
   def index 
      @categories = Category.paginate(page: params[:page], per_page: 8)
   end
   
   def new 
      @category = Category.new
   end
   
   def create 
      @category = Category.new(category_params)
      if @category.save
         flash[:success] = "Category successfully created!"
         redirect_to categories_path
      else
         render "new"
      end
   end
   
   def show
      @category = Category.find(params[:id])
      @category_articles = @category.articles.paginate(page:params[:page], per_page: 5)
      
   end
   
#################################################################################
   # private is only visible in this controller
   private def category_params
      #params - from params
      #.require - top level key
      #.permit - attributes permitted
      params.require(:category).permit(:name)
   end
   
end