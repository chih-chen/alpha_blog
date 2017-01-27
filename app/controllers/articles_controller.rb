class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(title: params[:article][:title], description: params["article"]["description"])
        if @article.save
            flash[:success] = "Article successfuly created!"
            redirect_to article_path(@article)
        else    
            render "/articles/new"    
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
       @article = Article.find(params[:id]) 
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(title: params[:article][:title], description: params[:article][:description])
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
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:info] = "Article successfuly deleted!"
            redirect_to articles_path
        end
    end
end