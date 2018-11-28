class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pools = Pool.all.where.not(latitude: nil, longitude: nil)
    @markers = @pools.map do |pool|
      {
        lng: pool.longitude,
        lat: pool.latitude
      }
    end
  end

  def dashboard
    @pools = Pool.where(user: current_user)
  end
end
