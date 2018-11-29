class UsersController < ApplicationController
  before_action :set_user, only: [:edit]
  def show
    @user = current_user
  end

  def edit
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id]) if User.count != 0
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :party_lover, :avatar, :stroke, :party_quote)
  end
end
