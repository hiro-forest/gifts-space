class GiftsController < ApplicationController
  # before_action :set_hope, only: [:new]

  def index
    hopes = Hope.all.order("id DESC")
    @hopes = hopes.first(15)
  end



  private

  def hope_params
    params.require(:hope).permit(
      :message,
      :image,
      :desired_price
    ).merge(:user_id)
  end

  def set_hope
    binding.pry
    @hope = Hope.find(id: params[:format])
    binding.pry
  end

end
