class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @offers = Offer.all
  end

  def myoffers
    @offers = Offer.all
    @myoffers = []
    @offers.each do |offer|
      @myoffers << offer if offer.seller == current_user
    end
  end

  def mybookings
    @bookings = Booking.all
    @mybookings = []
    @bookings.each do |booking|
      @mybookings << booking if booking.buyer == current_user
    end
  end

end
