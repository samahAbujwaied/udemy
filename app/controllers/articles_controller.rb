class ArticlesController < ApplicationController

  before_action :set_article , only: [:show, :edit, :update, :destroy]
  def index
    @article = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Artical was Updated sucssesfuly!'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def create
    # to render data as a JSON on browser
    # render plain: params[:article]
    # @article = Artical.new(params[:article])
    @article = Article.new(article_params)
    if @article.save
      # redirect_to @article
      flash[:notice] = 'Artical was created sucssesfuly!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  # why permit
  # CRUD
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end
end
