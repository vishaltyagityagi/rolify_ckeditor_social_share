class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login,:email, :username,:firstname, :lastname, :password, :password_confirmation, :remember_me) }
devise_parameter_sanitizer.for(:sign_in)  { |u| u.permit(:username,:login,:password,:remember_me) }

end
# private
#
# def current_user
#   @current_user ||= User.find(session[:user_id]) if session[:user_id]
# end
# helper_method :current_user

end
