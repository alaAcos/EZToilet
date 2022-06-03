class FeaturesController < ApplicationController
  before_action :set_toilet

  def index
    @features = @toilet.features
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.toilets << @toilet
    if @feature.save
      flash[:success] = "Your feature has been successfully added! 🗞"
      redirect_to toilet_path(@toilet)
    else
      render :new
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :presence, :details)
  end

  def set_toilet
    @toilet = Toilet.find(params[:toilet_id])
  end
end
