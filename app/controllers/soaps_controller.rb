class SoapsController < ApplicationController
  def index
    @soaps = Soap.all
  end

  def show
  end
end
