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
    if @booking.save
      flash[:success] = "Your request successfully submitted! 🚽"
      redirect_to toilet_path(@booking.toilet)
    else
      render :new
    end
  end

  def edit
    @booking = @toilet.bookings.find(params[:id])
  end

  def update
    @booking = @toilet.bookings.find(params[:id])
    @booking.update(booking_params)
    @booking.save ? (redirect_to toilet_path(@booking.toilet)) : (render :edit)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :duration, :status)
  end

  def set_toilet
    @toilet = Toilet.find(params[:toilet_id])
  end
end
