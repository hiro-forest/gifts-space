class GiftsController < ApplicationController
  # before_action :set_hope, only: [:new]

  def index
    hopes = Hope.all.order("id DESC")
    @hopes = hopes.first(15)
    @user = User.find_by(id: current_user.id)
    params[:format] = @user.id
  end



  private

  def hope_params
    params.require(:hope).permit(
      :message,
      :image,
      :desired_price
    ).merge(:user_id)
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :provider,
      :uid,
      :myimage,
      :photo,
      :comment
    )
  end

end
