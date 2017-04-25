class ApartmentsController < ApplicationController
  protect_from_forgery except: [:show, :find]

  def show
    @apartment = Apartment.find(params[:id])
  end

  def find
    @apartment = Apartment.find_by("street_address": params[:street_address])
    if @apartment
      render :js => "window.location = '#{apartment_path(@apartment.id)}'"
    else
      render status: 404
    end
  end

  def create
    @apartment = Apartment.find_by(street_address: apartment_params[:street_address]);
    if !@apartment
      @apartment = Apartment.create(apartment_params)
      if @apartment.save
        @petition = Petition.new(apartment: @apartment)
        @petition.save
        flash[:success] = "A campaign was created for #{@apartment.street_address}. Thank you!"
        redirect_to apartment_path(@apartment)
      else
        flash[:warning] = @apartment.errors.full_messages.join(", ")
        redirect_to root_path
      end
    else
      flash[:success] = "A campaign already exists for #{@apartment.street_address}!"
      redirect_to apartment_path(@apartment)
    end
  end

  private

  def apartment_params
    params.require(:apartment).permit(:street_address)
  end

end
