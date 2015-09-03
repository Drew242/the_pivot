class JobsController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find_by(slug: params[:id])
    @jobs = Job.where(status: 'active').paginate(page: params[:page])
  end

  # def show
  #   @job = Job.find(params[:id])
  # end

  private

  def searching_for_title?
    return false unless params[:search_title]
    return true unless params[:search_title].empty?
    false
  end

  def searching_for_location?
    return false unless params[:search_location]
    return true unless params[:search_location].empty?
    false
  end
end
