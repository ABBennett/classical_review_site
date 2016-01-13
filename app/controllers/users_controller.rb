class UsersController < ApplicationController
  before_action :authorize_member

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
end
