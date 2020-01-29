class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,
                                                          :provider,
                                                          :uid,
                                                          :myimage,
                                                          :myimage_cache,
                                                          :photo,
                                                          :photo_cache,
                                                          :comment])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,
                                                          :provider,
                                                          :uid,
                                                          :myimage,
                                                          :myimage_cache,
                                                          :photo,
                                                          :photo_cache,
                                                          :comment])
  end
end
