class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pools = Pool.all
  end

  def dashboard
    @pools = Pool.where(user: current_user)
  end
end
