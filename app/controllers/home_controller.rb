class HomeController < ApplicationController
  def index
    @soaps = Soap.page(params[:page])
  end
end