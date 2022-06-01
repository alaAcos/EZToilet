class PagesController < ApplicationController
  def home
    @toilets_samples = []
    4.times do
      @toilets_samples << Toilet.find(rand(Toilet.first.id..(Toilet.all.length)))
    end
  end

  def dashboard
    # route + pages/dashboard.html.erb
    # displays @bookings = bookings.where(user = current_user)
    # displays @toilets = Toilet.where(user = current_user)
    # @toilet.each toilet.bookings
  end
end
