class PagesController < ApplicationController
  def home
    @toilets_samples = []
    4.times do
      @toilets_samples << Toilet.find(rand(Toilet.first.id..(Toilet.all.length)))
    end
    @toilets = Toilet.all.sample(4)
  end

  def dashboard
    @userbookings = Booking.where(user_id: current_user)
    @usertoilets = Toilet.where(user: current_user)
    # @toilet.each toilet.bookings
  end
end
