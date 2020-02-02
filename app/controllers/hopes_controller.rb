class HopesController < ApplicationController
  before_action :set_user, only: [:new]

  def new
    @hope = Hope.new
    if session[:message] != nil?
      @hope.message = session[:message]
    end
  end

  def show
    @hope = Hope.find(params[:id])
    @user = User.find(@hope.user_id)
    if @profile = Profile.find_by(user_id: @user.id)
    else
      @profile = Profile.new
    end
  end

  def create
    @hope = Hope.new(hope_params.merge(user_id: current_user.id))
    if @hope.save
      redirect_to root_path, notice: '投稿しました'

    else
      flash.now[:notice] = '入力欄を確認してください'
      render :new
    end
  end

  def edit
    @hope = Hope.find(params[:id])
  end

  def update
    @hope = Hope.find(params[:id])
    if @hope.update(update_params)
      redirect_to hope_path
    else
      render :edit
    end
  end

  def destroy
    hope = Hope.find(params[:id])
    if hope.user_id == current_user.id
      hope.destroy
      redirect_to root_path
    else
      render :show
      flash.now[:alert] = 'もう一度入力してください'
    end
  end

  private

  def hope_params
    params.require(:hope).permit(
      :message,
      :image,
      :desired_price
    ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:hope).permit(
      :message,
      :image,
      :desired_price
    ).merge(user_id: current_user.id)
  end

  def set_user
    unless user_signed_in?
      redirect_to root_path, notice: 'ユーザー登録またはログインしてください'
    end
  end

end
