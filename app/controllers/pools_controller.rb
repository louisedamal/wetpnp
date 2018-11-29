class PoolsController < ApplicationController
  before_action :set_pool, only: [:edit, :update, :show, :destroy]

  def index
    @pools = policy_scope(Pool).order(created_at: :desc)
    @pools_user = current_user.pools
  end

  def new
    @pool = Pool.new
    authorize @pool
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    authorize @pool
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  def edit
    authorize @pool
  end

  def update
    @user = current_user
    @pool.update(pool_params)
    authorize @pool
    redirect_to pool_path(@pool)
  end

  def show
    authorize @pool
    @booking = Booking.new
    @review = Review.new
  end

  def destroy
    @pool.delete
    authorize @pool
    redirect_to pools_path
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :address, :price, :photo, :capacity, :city)
  end

  def set_pool
    @pool = Pool.find(params[:id]) if Pool.count != 0
  end
end
