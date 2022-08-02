class RessourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR content ILIKE :query"
      @ressources = Ressource.where(sql_query, query: "%#{params[:query]}%")
    else
      @ressources = Ressource.all
    end

  end

  def show 
    @ressource = Ressource.find(params[:id])
    authorize @ressource

  end

  def new
    @ressource = Ressource.new
    authorize @ressource
  end 

  def create
    @ressource = Ressource.new(ressource_params)
    @ressource.user = current_user
    authorize @ressource
    @ressource.save 
    redirect_to ressources_path(@ressource)
  end

  def destroy
    @ressource = Ressource.find(params[:id])
    authorize @ressource
    @ressource.destroy

    redirect_to ressources_path
  end

  def edit
    @ressource = Ressource.find(params[:id])
    authorize @ressource

  end

  def update
    @ressource = Ressource.find(params[:id])
    authorize @ressource
    photos = @ressource.photos
    @ressource.update(ressource_params)
    redirect_to ressource_path(@ressource)
  end

  private 

  def ressource_params 
    params.require(:ressource).permit(:title, :content, photos: [])
  end 

end
