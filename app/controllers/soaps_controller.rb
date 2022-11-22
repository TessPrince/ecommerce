class SoapsController < ApplicationController
  def index
    @soaps = Soap.page(params[:page])
  end

  def show
  end
end
