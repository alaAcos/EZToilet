class ReviewsController < ApplicationController
  before_action :set_toilet

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.toilet = set_toilet
    @review.user = current_user
    if @review.save
      redirect_to toilet_path(@review.toilet)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_toilet
    @toilet = Toilet.find(params[:toilet_id])
  end
end
