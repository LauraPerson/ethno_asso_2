class RessourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  
  def index
    @ressources = Ressource.all

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

  private 

  def ressource_params 
    params.require(:ressource).permit(:title, :content, :photo)
  end 

end
