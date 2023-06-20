class RessourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_ressource, only: %i[show archive move]


  
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR content ILIKE :query"
      @ressources = Ressource.where(sql_query, query: "%#{params[:query]}%")
    else
      @ressources = Ressource.all.order(created_at: :desc)
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
    flash.alert = "Nouvelle ressource ajoutée"

    redirect_to ressources_path(@ressource)
  end

  def move
    
    @ressource.insert_at(params[:position].to_i)
    head :ok
  end 

  def destroy
    @ressource = Ressource.find(params[:id])
    authorize @ressource
    @ressource.destroy
    flash.alert = "Ressource supprimée"

    redirect_to ressources_path
  end

  def edit
    @ressource = Ressource.find(params[:id])
    authorize @ressource

  end

  def update
    @ressource = Ressource.find(params[:id])
    if @ressource.update(ressource_params.reject { |k| k["photos"] })
      if ressource_params[:photos].present?
        ressource_params[:photos].each do |photo|
          @ressource.photos.attach(photo)
        end
      end
      flash.alert = "Ressource Modifiée"
      redirect_to ressources_path(@ressource)
    else
      flash.alert = "Ressource non modifiée"
      redirect_to ressources_path
    end
    authorize @ressource
  end

  private 

  def ressource_params 
    params.require(:ressource).permit(:title, :content, photos: [])
  end 

  def find_ressource
    @ressource = Ressource.find(params[:id])
  end


end
