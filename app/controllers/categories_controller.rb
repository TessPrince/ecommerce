class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @categories = Category.page(params[:page])

    add_breadcrumb "Categories", "index"
  end

  def show
    @category = Category.find(params[:id])
    @soaps = @category.soaps
    add_breadcrumb @category.name, "index"
  end
end
