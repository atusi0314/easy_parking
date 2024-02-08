class ParkingsController < ApplicationController

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    if @parking.save
      flash[:notice] = "スポットを投稿していただきありがとうございます！"
      redirect_to parkings_path
    else
      render :new
    end
  end

  def index
    @parking = Parking.page(params[:page])
    @map = Parking.pluck(:user_id, :address, :latitude, :longitude)
  end

  def show
    @parking = Parking.find(params[:id])
    @user = @parking.user_id
  end

  def destroy
    parking = Parking.find(params[:id])
    if parking.destroy
      flash[:notice] = "スポットを削除しました！"
      redirect_to parkings_path
    else
      render :show
    end
  end

  private

  def parking_params
    params.require(:parking).permit(:spot_name, :address, :image, :caption, :latitude, :longitude)
  end

end