class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)

    add_breadcrumb "My Orders"
  end

  def show
    @order = Order.find(params[:id])

    @line_items = Stripe::Checkout::Session.list_line_items(@order.payment)

    add_breadcrumb "My Orders", orders_index_path
    add_breadcrumb @order.id
  end

  def admin
  end
end
