class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: %i[show archive]


  def index
    # @unarchived_articles = Article.all.where(archive: false)
    @articles = Article.order(created_at: :desc)
    @unarchived_articles = @articles.where(archive: false)
    @archived_articles = @articles.where(archive: true)
  end

  def show 
    @article = Article.find(params[:id])
    authorize @article
  end


  def new
    @article = Article.new
    authorize @article

  end 

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    @article.save 
    flash.alert = "Nouveau projet ajouté"

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article

  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    photos = @article.photos
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def archive
    @article.update(archive: true)
    # redirect_to company_path(@project.company)
    flash.alert = "Projet archivé"
    redirect_to article_path(@article)

  end


  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    flash.alert = "Projet supprimé"


    redirect_to articles_path
  end

  private 

  def article_params 
    params.require(:article).permit(:title, :content, :archive, photos: [] )
  end 

  def find_article
    @article = Article.find(params[:id])
  end


end
