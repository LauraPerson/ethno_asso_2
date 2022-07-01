class UsersController < ApplicationController
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
    authorize @user
    @user.save 
    redirect_to users_admin_path(@user)
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to users_admin_path
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :description)
  end
end
