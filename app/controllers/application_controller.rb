class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? 
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def show
  end

  # def after_sign_up_path_for(resource)
  #   new_user_address_path
  # end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:name,:first_name_kana,:name_kana,:birthday])
  end


  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end


