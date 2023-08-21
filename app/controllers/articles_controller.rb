class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
      
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      redirect_to new_article_path, notice:  @article.errors.full_messages
      # flash.now[:alert] = 'Article could not be saved.'
      # render 'new'
    end
  end
  
  

  # private

  # def article_params
  #   params.require(:article).permit(:title, :description)
  # end
end
