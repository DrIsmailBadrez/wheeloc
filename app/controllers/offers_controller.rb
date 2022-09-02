class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.seller = current_user
    @offer.save
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_path, status: :see_other }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :address, :photo)
  end
end
