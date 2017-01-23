class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end
    
    def create
        @articleCreated = Article.new(title: params[:title], description: params[:description])
        @articleCreated.save
        redirect_to articles_show
    end
end