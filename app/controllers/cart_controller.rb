class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id #pushs the id onto the end of the array
      soap = Soap.find(id)
      flash[:notice] = " #{soap.name} added to cart."
    end

    redirect_to root_path
  end

  def destroy

  end

end
