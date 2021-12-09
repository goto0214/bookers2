class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]


  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end






  before_action :configure_permitted_parametars, if: :devise_controller?

  protected
  def configure_permitted_parametars
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end

