class OrderDetailsController < ApplicationController
  before_action :set_order

  def create
    @order_detail = @order.order_detail.create(order_params)
    @order_details = current_order.order_details

    flash[:notice] = " #{@order_detail.soap.name} added to cart."

    redirect_back_or_to request.referrer
  end

  def update
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_params)
    @order_details = current_order.order_details

    flash[:notice] = " #{@order_detail.soap.name} updated from cart."

    redirect_back_or_to request.referrer
  end

  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    @order_details = current_order.order_details

    flash[:notice] = " #{@order_detail.soap.name} removed from cart."

    redirect_back_or_to request.referrer
  end

  private

  def order_params
    params.require(:order_detail).permit(:soap_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
