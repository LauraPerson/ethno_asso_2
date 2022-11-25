class UsersController < ApplicationController
  
  def index
    @users = policy_scope(User.all.where(archive: false))
    @archived_users = User.all.where(archive: true)
    authorize @users
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    #current_user.super_admin?
    @user = User.new
    authorize @user
  end 

  def create
    @user = User.new(user_params)
    @user.admin = true
    @user.super_admin = true
    authorize @user
    @user.save 
    flash.alert = "Nouveau membre ajouté(e)"
    redirect_to dashboard_path(current_user)
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to dashboard_path
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    flash.alert = "Membre supprimé"
    redirect_to users_path
  end


  #  puisque les articles et ressources dépendent des users, on ne supprime pas vraiment les utilisateurs, on les arhive 


  def archive
    @user = User.find(params[:id])

    @user.update(archive: true)
    # redirect_to company_path(@project.company)
    flash.alert = "Membre Supprimé"
    redirect_to users_path
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :description, :admin, :photo)
  end
end
