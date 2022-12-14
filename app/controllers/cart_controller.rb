class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id #pushs the id onto the end of the array
      soap = Soap.find(id)
      flash[:notice] = " + #{soap.name} added to cart."
    end

    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    soap = Soap.find(id)
    redirect_to root_path
    flash[:notice] = " - #{soap.name} removed from cart."
  end

  def index

  end

  def show
    @order_details = current_order.order_details
    add_breadcrumb "My Cart"
  end
end
