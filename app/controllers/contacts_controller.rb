class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.alert = "Message Envoyé"
    else
      flash.alert = "Message non Envoyé"
      render :new
    end
  end
end
