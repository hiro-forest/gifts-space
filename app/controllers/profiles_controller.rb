class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
    @user = User.find_by(id: current_user.id)
  end

  def show
    if @profile = Profile.find_by(user_id: params[:id])
    else
      @profile = Profile.new
    end
    @user = User.find(params[:id])
  end

  def create
    @user = User.find_by(id: current_user.id)
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path, notice: 'プロフィールを登録しました'
    else
      redirect_to new_profile_path, notice: 'プロフィール写真は必須です'
    end
  end

  def edit
    @user = User.find_by(id: current_user.id)
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.user_id == current_user.id
      @profile.update(profile_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
    if @profile.user_id == current_user.id
      @profile.destroy
      redirect_to root_path, notice: 'プロフィールを削除しました'
    else
      render :show
      flash.now[:alert] = 'もう一度入力してください'
    end
  end

end

  private

  def profile_params
    params.require(:profile).permit(
      :picture,
      :picture_cache,
      :myphoto,
      :myphoto_cache,
      :mycomment
    ).merge(user_id: current_user.id)
  end
