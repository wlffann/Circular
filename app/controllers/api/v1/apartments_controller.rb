class Api::V1::ApartmentsController < ApplicationController
  respond_to :json, :html

  def show
    respond_with Apartment.find_by(id: params[:id])
  end

  def update
    apartment = Apartment.find(params[:id])
    if apartment.update(apartment_params)
      render json: apartment
    else
      render :json => { :errors => apartment.errors.full_messages }, :status => 422
    end
  end

  def create
    apartment = Apartment.new(apartment_params)
    if apartment.save
      render json: apartment
    else
      render :json => { :errors => apartment.errors.full_messages }, :status => 422
    end
  end

  private

  def apartment_params
    params.permit(:address)
  end
end