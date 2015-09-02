class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find_by(slug: params[:id])
    @jobs    = @category.jobs
  end

  def index
    @categories = Category.all
  end
end
