class ParkingsController < ApplicationController
  
  def new
    @parking = Parking.new
  end
  
  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    @parking.save
    redirect_to parkings_path
  end

  def index
    @parking = Parking.all
  end

  def show
  end
  
  private
  
  def parking_params
    params.require(:parking).permit(:spot_name, :address, :image, :caption)
  end
  
end