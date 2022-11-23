class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private
  def initialize_session
    session[:shopping_cart] ||= [] #empty array of product IDs
  end

  def cart
    #pass an array of product IDs and get back a collection of products
    Soap.find(session[:shopping_cart])
  end
end
