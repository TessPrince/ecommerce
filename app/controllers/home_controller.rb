class HomeController < ApplicationController
  def index
    @soaps = Soap.all
  end
end