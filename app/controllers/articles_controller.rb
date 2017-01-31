class ArticlesController < ApplicationController
    
    #set the value the @article
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #add a middleware here to restrict from the controller and not only from the UI
    before_action :require_user, except: [:index, :show]
    
    def new
        @article = Article.new
    end
    
    def create
        # i could do like this, but not safe either practical - solution: define a function
        # @article = Article.new(title: params[:article][:title], description: params["article"]["description"])
        @article = Article.new(article_params) # it autom adds the category and saves everything
        @article.user = current_user
        if @article.save
            flash[:success] = "Article successfuly created!"
            redirect_to article_path(@article)
        else    
            render "/articles/new"    
        end
    end
    
    def show
        # @article = Article.find(params[:id])
    end
    
    def edit
    #   @article = Article.find(params[:id]) 
    end
    
    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Article successfuly updated!" 
            redirect_to article_path(@article)
        else
            render "edit"
        end
    end
    
    def index
        # @articles = Article.all #grabs all article from the db, return an array
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
       
    def destroy
        # @article = Article.find(params[:id])
        if @article.destroy
            flash[:info] = "Article successfuly deleted!"
            redirect_to articles_path
        end
    end
    
############################ FUNCTION DEFINITION ############################### 
    def article_params
      params.require(:article).permit(:title,:description,:category_ids=>[]) #indicates that will come as array
    end
    
    def set_article
      return @article = Article.find(params[:id])
    end
end