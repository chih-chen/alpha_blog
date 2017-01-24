class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(title: params[:article][:title], description: params["article"]["description"])
        if @article.save
            flash[:notice] = "Article successfuly created!"
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
        if @article.update({title: params[:article][:title], description: params[:article][:description]})
            flash[:notice] = "Article successfuly updated!" 
            redirect_to article_path(@article)
        else
            render "edit"
        end
    end
    
    def index
        
    end
        
end