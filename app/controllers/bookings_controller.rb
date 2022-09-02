class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.buyer = current_user
    @booking.offer = @offer
    @booking.save
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @offer = @booking.offer
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to mybookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to mybookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
