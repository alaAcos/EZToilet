class PagesController < ApplicationController
  def home
  end

  def dashboard
    # route + pages/dashboard.html.erb
    # displays @bookings = bookings.where(user = current_user)
    # displays @toilets = Toilet.where(user = current_user)
    # @toilet.each toilet.bookings
  end
end
