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
end