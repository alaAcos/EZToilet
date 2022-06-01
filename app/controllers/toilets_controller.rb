class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude
      }
    end
  end

  def show
    @toilet = Toilet.find(params[:id])
  end

  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user = current_user
    @toilet.save!
    @toilet.save ? (redirect_to toilet_path(@toilet)) : (render :new)
  end

  def edit
    @toilet = Toilet.find(params[:id])
  end

  def update
    @toilet = Toilet.find(params[:id])
    @toilet.update(toilet_params)

    redirect_to toilet_path(@toilet)
  end

  private

  def toilet_params
    params.require(:toilet).permit(:name, :description, :price, :available, :address, photos: [])
  end
end
