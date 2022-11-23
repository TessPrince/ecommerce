class SoapsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @soaps = Soap.page(params[:page])
    @categories = Category.all

    add_breadcrumb "Products", "index"
  end

  def show
    @soap = Soap.find(params[:id])
    @category = @soap.category
    add_breadcrumb "Products", "index"
    add_breadcrumb @category.name, "index"
    add_breadcrumb @soap.name
  end

  def search
    add_breadcrumb "Soaps", "index"
    wildcard = "%#{params[:keywords]}%"
    category_wildcard = params[:category]

    if category_wildcard != ""
      @soaps = Soap.where("name LIKE ? OR description LIKE ? AND category_id = ?", wildcard, wildcard, category_wildcard).page(params[:page])
    else
      @soaps = Soap.where("name LIKE ? OR description LIKE ?", wildcard, wildcard)
    end
  end
end
