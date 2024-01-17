class ParkingsController < ApplicationController

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    if @parking.save
      redirect_to parkings_path
    else
      render :new
    end
  end

  def index
    @parking = Parking.page(params[:page])
  end

  def show
    @parking = Parking.find(params[:id])
  end

  def destroy
    parking = Parking.find(params[:id])
    parking.destroy
    redirect_to parkings_path
  end

  private

  def parking_params
    params.require(:parking).permit(:spot_name, :address, :image, :caption)
  end

end