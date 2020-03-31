class CategoriesController < ApplicationController

  def index
    @categories = Category.(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end
end
