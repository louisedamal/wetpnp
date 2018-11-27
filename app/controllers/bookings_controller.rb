class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    authorize @bookings
  end

  def show
  end

  def new
    @pool = Pool.find(params[:pool_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pool = Pool.find(params[:pool_id])
    authorize @booking
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
    authorize @booking
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
