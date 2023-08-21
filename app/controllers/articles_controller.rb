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

  def edit
    @article = Article.find(params[:id])  
  end   

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
      
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article 
    else
      redirect_to new_article_path, notice:  @article.errors.full_messages
      # flash.now[:alert] = 'Article could not be saved.'
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])  
    if  @article.update(params.require(:article).permit(:title, :description))
    flash[:notice] = "Article was Updated Successfully!!"
    redirect_to @article
   else
    render 'edit'
   end 
  end  

  # private

  # def article_params
  #   params.require(:article).permit(:title, :description)
  # end
end
