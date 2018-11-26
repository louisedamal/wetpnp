class PoolsController < ApplicationController
  before_action :set_pool, only: [ :edit, :update, :show, :destroy ]

  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
  end

  def create
    @user = current_user
    @pool = Pool.new(pool_params)
    @pool.user = @user
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = current_user
    @pool.update(pool_params)
    redirect_to pool_path(@pool)
  end

  def show
  end

  def destroy
    @pool.delete
    redirect_to pools_path
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :address, :price, :photo, :capacity)
  end

  def set_pool
    @pool = Pool.find(params[:id])
  end
end
