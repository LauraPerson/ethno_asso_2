class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
    authorize @partner

  end 

  def create
    @partner = Partner.new(partner_params)
    authorize @partner
    @partner.save 
    flash.alert = "Nouveau partenaire ajouté"

    redirect_to partners_path
  end

  def destroy
    @partner = Partner.find(params[:id])
    authorize @partner
    @partner.destroy
    flash.alert = "Partenaire supprimé"
    redirect_to partners_path
  end

  def edit
    @partner = Partner.find(params[:id])
    authorize @partner
  end

  def update
    @partner = Partner.find(params[:id])
    @partner.update(partner_params)
    authorize @partner
    flash.alert = "Partenaire Modifié"
    redirect_to partners_path
  end

  private

  def partner_params 
    params.require(:partner).permit(:name, :photo )
  end


end
