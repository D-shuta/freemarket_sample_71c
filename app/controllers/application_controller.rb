class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:name,:first_name_kana,:name_kana,:birthday,:phone_number])
end
