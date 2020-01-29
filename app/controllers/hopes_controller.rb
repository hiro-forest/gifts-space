class HopesController < ApplicationController
  # before_action :set_user

  def new
    @hope = Hope.new
    if session[:message] != nil?
      @hope.message = session[:message]
    end
  end

  def show
    @hope = Hope.find_by(id: params[:id])
    @user = User.find(@hope.user_id)
  end

  def create
    @hope = Hope.new(hope_params.merge(user_id: current_user.id))
    if @hope.save
      redirect_to root_path, notice: '登録しました'

    else
      @hope = @user..includes(:user)
      flash.now[:alert] = 'もう一度入力してください'
      render :new
    end
    # if @hope.invalid?
    #   session[:message] = hope_params[:message]
    #   session[:image] = hope_params[:image]
    #   session[:desired_price] = hope_params[:desired_price]

    #   session[:error_message] = @hope.errors.messages[:message].first
    #   session[:error_image] = @hope.errors.messages[:image].first
    #   session[:error_desired_price] = @hope.errors.messages[:desired_price].first
    # else
    # end
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
    if user_signed_in?
      @user = User.find(params[user_id: current_user])
    else
      redirect_to root_path
    end
  end

end
