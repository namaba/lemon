class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のページ
  def after_sign_in_path_for(resource)
    searches_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :image ])
  end




end
