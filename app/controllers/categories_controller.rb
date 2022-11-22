class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @soaps = @category.soaps
  end
end
