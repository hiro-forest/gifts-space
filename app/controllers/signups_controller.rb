class SignupsController < ApplicationController
  before_action :save_to_session, only: :address

  def new
    session.clear
  end

  def user
    @user = User.new
  end

  def address
    @address = Address.new
    @user = User.new unless user_signed_in?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      provider: session[:provider],
      uid: session[:uid]
    )
    if @user.save
      @address = Address.new(address_params.merge(user_id: @user.id))
    elsif session[:id] != nil
      @address = Address.new(address_params.merge(user_id: session[:id]))
    elsif user_signed_in?
      @address = Address.new(address_params.merge(user_id: current_user.id))
    else
      redirect_to user_signups_path
    end
    if @address.save
      if session[:id] == nil
        session[:id] = @user.id
      end
        sign_in User.find(session[:id]) unless user_signed_in?
        redirect_to new_card_path, notice: 'ユーザー登録しました'
    else
      session[:flag] = @address.errors.messages.first
      session[:error_postal_code] = @address.errors.messages[:postal_code].first
      session[:error_prefecture] = @address.errors.messages[:prefecture].first
      session[:error_city] = @address.errors.messages[:city].first
      session[:error_street] = @address.errors.messages[:street].first
      session[:error_building] = @address.errors.messages[:building].first
      if session[:id] == nil
        session[:id] = @user.id
      end
      redirect_to address_signups_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to signup_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.id == current_user.id
      user.destroy
      redirect_to root_path, notice: 'ユーザー削除しました'
    else
      redirect_to root_path, alert: '削除出来ませんでした'
    end
  end

end

def save_to_session
  unless session[:flag]
    if session[:uid] == nil
      session[:password] = user_params[:password]
    end
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      provider: session[:provider],
      uid: session[:uid]
    )
    if @user.invalid?
      if session[:uid] == nil
        session[:password] = user_params[:password]
      end
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]

      session[:error_nickname] = @user.errors.messages[:nickname].first
      session[:error_email] = @user.errors.messages[:email].first
      session[:error_password] = @user.errors.messages[:password].first
      if session[:uid] == nil
      redirect_to user_signups_path
      else
        redirect_to root_path
      end
    end
  end
end


  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :provider,
      :uid,
    )
  end

  def address_params
    params.require(:address).permit(
      :postal_code,
      :prefecture,
      :city,
      :street,
      :building
    )
  end
