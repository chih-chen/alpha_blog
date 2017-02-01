class CategoriesController < ApplicationController
   
   before_action :require_admin, only: [:new, :create, :edit]
   
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
   
   def edit 
      @category = Category.find(params[:id])
   end
   
   def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
         flash[:success] = "Category name successfully updated!"
         redirect_to category_path(@category)
      else
         render "edit"
      end
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