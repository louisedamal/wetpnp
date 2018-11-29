class ReviewsController < ApplicationController
  def new
    @pool = Pool.find(params[:pool_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.pool = Pool.find(params[:pool_id])
    authorize @review
    if @review.save
      redirect_to pool_path(@review.pool)
    else
      redirect_to new_pool_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
