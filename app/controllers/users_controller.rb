class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin_can_delete, only: [:destroy]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User Deleted"
    redirect_to users_path
  end

  private

  def only_admin_can_delete
    unless current_user.admin
      flash[:notice] = "Only admin's can delete users"
      redirect_to users_path
    end
  end
end
