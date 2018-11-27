class PoolsController < ApplicationController
  before_action :set_pool, only: [:edit, :update, :show, :destroy]

  def index
    @pools = Pool.all
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
  end

  def destroy
    @pool.delete
    authorize @pool
    redirect_to pools_path
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :address, :price, :photo, :capacity)
  end

  def set_pool
    @pool = Pool.find(params[:id]) if Pool.count != 0
  end
end
