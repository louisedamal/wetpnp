class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @pools = Pool.all.where.not(latitude: nil, longitude: nil)
    @markers = @pools.map do |pool|
      {
        lng: pool.longitude,
        lat: pool.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { pool: pool })
      }
    end

  end

  def dashboard
    @pools = Pool.where(user: current_user)
  end
end
