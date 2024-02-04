class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parking = @user.parkings
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to parkings_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました！"
      redirect_to user_path(@user.id)
    else
      render :ender
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
