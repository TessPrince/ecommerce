class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @soaps = Soap.page(params[:page])
    @categories = Category.all

    add_breadcrumb "Products", "/soaps/index"
  end
end