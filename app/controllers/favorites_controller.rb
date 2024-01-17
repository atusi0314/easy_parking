class FavoritesController < ApplicationController
  
  def create
    parking = Parking.find(params[:parking_id])
    favorite = current_user.favorites.new(parking_id: parking.id)
    favorite.save
    redirect_to parking_path(parking)
  end
  
  def destroy
    parking = Parking.find(params[:parking_id])
    favorite = current_user.favorites.find_by(parking_id: parking.id)
    favorite.destroy
    redirect_to parking_path(parking)
  end
end
