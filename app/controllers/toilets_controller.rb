class ToiletsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @toilets = Toilet.where(sql_query, query: "%#{params[:query]}%")
    else
      @toilets = Toilet.all
    end
    @markers = @toilets.geocoded.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { toilet: toilet }),
        image_url: helpers.asset_url("toileticon.png")
      }
    end
  end

  def show
    @toilet = Toilet.find(params[:id])
    @booking = Booking.new
    @marker = [{ lat: @toilet.latitude, lng: @toilet.longitude, info_window: render_to_string(partial: "info_window", locals: { toilet: @toilet }), image_url: helpers.asset_url("toileticon.png")}]
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
    params.require(:toilet).permit(:name, :description, :price, :available, :address, feature_id: [], photos: [])
  end
end
