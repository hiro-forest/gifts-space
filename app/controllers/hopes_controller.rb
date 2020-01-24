class HopesController < ApplicationController
  before_action :set_group

  def new
    @hope = Hope.new

  end

  def create
    @hope = @user.hope.new(hope_params)
    if @hope.save
      flash.now[:alert] = '登録しました'
    else
      @hope = @user..includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :new
    end
  end
  
  private

  def hope_params
    params.require(:hope.permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_group
    @user = user.find(params[:user_id])
  end
end
end
