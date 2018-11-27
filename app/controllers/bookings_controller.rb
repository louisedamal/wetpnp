class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = Booking.where(:id == current_user)
  end

  def show
  end

  def new
    @pool = Pool.find(params[:pool_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pool = Pool.find(params[:pool_id])
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = current_user
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.delete
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
