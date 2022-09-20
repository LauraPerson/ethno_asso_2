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
    @partner.user = current_user
    authorize @partner
    @partner.save 
    flash.alert = "Nouveau partenaire ajouté"

    redirect_to partners_path
  end

end
