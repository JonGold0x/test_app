class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #@article = Article.find(params[:id])
    
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    debugger
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = @user
    if  @article.save
      flash[:success] = "article successfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully destroyed."
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
end