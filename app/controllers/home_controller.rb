class HomeController < ApplicationController
  def index
    @soaps = Soap.page(params[:page])
    @categories = Category.all
  end
end