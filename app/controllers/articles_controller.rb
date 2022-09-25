class ArticlesController < ApplicationController
    def show
        # debugger
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end

    def new 
        @article = Article.new
    end

    def create
        # render plain: params[:articles]
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was cretade successfully"
            redirect_to @article
        else
            render 'new', status: :unprocessable_entity
        end
        # redirect_to article_path(@article) or
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def update 
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end 

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end