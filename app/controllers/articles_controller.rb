class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def edit
   
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
   
    if  @article.update(params.require(:article).permit(:title, :description))
    flash[:notice] = "Article was Updated Successfully!!"
    redirect_to @article
   else
    render 'edit'
   end 
  end  

  def destroy
     
    @article.destroy
    redirect_to article_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

end