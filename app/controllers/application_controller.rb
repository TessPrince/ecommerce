class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:address, :province_id, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :address, :province_id, :email, :password, :password_confirmation, :current_password) }
  end

  private
  def initialize_session
    session[:shopping_cart] ||= [] #empty array of product IDs
  end

  def cart
    #pass an array of product IDs and get back a collection of products
    Soap.find(session[:shopping_cart])
  end
end
