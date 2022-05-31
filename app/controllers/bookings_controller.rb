class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.toilet = Toilet.find(params[:toilet_id])
    @booking.save ? (redirect_to toilet_path(@booking.toilet)) : (render :new)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :duration)
  end
end
