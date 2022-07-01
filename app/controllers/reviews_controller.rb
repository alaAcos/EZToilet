class ReviewsController < ApplicationController
  before_action :set_toilet

  def new
    @review = Review.new
    @toilet = set_toilet
  end

  def create
    @review = Review.new(review_params)
    @review.toilet = set_toilet
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to toilet_path(set_toilet) }
        format.json
      else
        format.html { render "toilets/show" }
        format.json
      end
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
