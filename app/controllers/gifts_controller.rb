class GiftsController < ApplicationController
  before_action :gift_params, only: [:buy]
  before_action :set_card, only: [:show]

  def index
    hopes = Hope.all.order("id DESC")
    @hopes = hopes.first(15)
    gifts = Gift.all.order("id DESC")
    @gifts = gifts.first(8)
    @user = User.find_by(id: current_user.id) if user_signed_in?
    @profile = Profile.find_by(user_id: current_user.id) if user_signed_in?
  end

  def show
    if @card.blank?
      redirect_to new_card_path, notice: 'クレジットカードの登録をお願いいたします'
    else
      @gift = Gift.new
      @hope = Hope.find(params[:id])
    end
  end

  def confirm
    @hope = Hope.find(params[:id])
    @gift = Gift.new(gift_params)
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def buy
    @card = Card.where(user_id: current_user.id).first
    @gift = Gift.new(gift_params)
    if  @gift.save!
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @gift.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
      redirect_to root_path, notice: 'ありがとうございます、支援を承りました'
    else
      redirect_to hope_path, notice: '失敗しました'
    end
  end

  private

  def gift_params
    params.require(:gift).permit(
      :price
    ).merge(user_id: current_user.id, hope_id: params[:id]
    )
  end

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

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end
