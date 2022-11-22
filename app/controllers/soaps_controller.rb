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
      @soaps = Soap.where("name LIKE ? AND category_id = ?", wildcard, category_wildcard).page(params[:page])
    else
      @soaps = Soap.where("name LIKE ?", wildcard)
    end
  end
end
