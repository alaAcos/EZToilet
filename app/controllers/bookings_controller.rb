class BookingsController < ApplicationController
  before_action :set_toilet

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @toilet.bookings.new(booking_params)
    @booking.user = current_user
    @booking.toilet = @toilet
    @booking.save ? (redirect_to toilet_path(@booking.toilet)) : (render :new)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :duration)
  end

  def set_toilet
    @toilet = Toilet.find(params[:toilet_id])
  end
end
