class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def show
    if @profile = Profile.find_by(user_id: current_user.id)
    else
      @profile = Profile.new
    end
    @user = User.find_by(id: current_user.id)
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: current_user.id)
    @profile = Profile.find_by(params[:id])
  end

  def update
    @profile = Profile.find_by(params[:id])
    if @profile.user_id == current_user.id
      @profile.update(profile_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  def destroy
    profile = Profile.find_by(params[:id])
    if profile.user_id == current_user.id
      profile.destroy
      redirect_to root_path
    else
      render :show
      flash.now[:alert] = 'もう一度入力してください'
    end
    return
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
