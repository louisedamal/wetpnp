class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
  end
end
