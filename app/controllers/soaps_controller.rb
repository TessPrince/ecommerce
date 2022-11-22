class SoapsController < ApplicationController
  def index
    @soaps = Soap.page(params[:page])
    @categories = Category.all
  end

  def show
  end

  def search
    wildcard = "%#{params[:keywords]}%"
    category_wildcard = params[:category]

    if category_wildcard != ""
      @soaps = Soap.where("name LIKE ? OR description LIKE ? AND category_id = ?", wildcard, wildcard, category_wildcard).page(params[:page])
    else
      @soaps = Soap.where("name LIKE ? OR description LIKE ?", wildcard, wildcard)
    end
  end
end
