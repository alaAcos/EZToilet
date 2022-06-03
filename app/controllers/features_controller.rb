class FeaturesController < ApplicationController
  before_action :set_toilet

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = @toilet.features.new(feature_params)
    @feature.toilet = @toilet
    if @feature.save
      flash[:success] = " Feature successfully added! 🚽"
      redirect_to toilet_path(@toilet)
    else
      render :new
    end
  end

  def edit
    @feature = @toilet.features.find(params[:id])
  end

  def update
    @feature = @toilet.features.find(params[:id])
    @feature.update(feature_params)
    @feature.save ? (redirect_to toilet_path(@feature.toilet)) : (render :edit)
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :presence, :details)
  end

  def set_toilet
    @toilet = Toilet.find(params[:toilet_id])
  end
end
