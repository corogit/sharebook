class User::UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
