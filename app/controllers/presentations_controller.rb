class PresentationsController < ApplicationController

  def edit
    @presentation = Presentation.find(params[:id])
    authorize @presentation
  end

  def update
    @presentation = Presentation.find(params[:id])
    @presentation.update(presentation_params)
    authorize @presentation
    flash.alert = "Présentation Modifiée"
    redirect_to root_path
  end

  private

  def presentation_params 
    params.require(:presentation).permit(:name, :content )
  end
end
