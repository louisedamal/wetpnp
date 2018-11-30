class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :cancel]

  def index
    @user = current_user
    @bookings = policy_scope(Booking)
    @bookings_as_swimmer = current_user.bookings.order(created_at: :desc)
    @bookings_as_owner = current_user.bookings_as_owner.order(created_at: :desc)
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
    @booking.update(status: "Acceptée")
    redirect_to bookings_path
  end

  def cancel
    @booking.update(status: "Annulée")
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
