class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.paginate(page: params[:page])
    if searching_for_title?
      @jobs = Job.where(id: Job.find_by_fuzzy_title(params[:search_title]).map(&:id)).paginate(page: params[:page])
    end

    if searching_for_location?
      @jobs = Job.where(id: Job.find_by_fuzzy_location(params[:search_location]).map(&:id)).paginate(page: params[:page])
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def searching_for_title?
    return false unless params[:search_title]
    true unless params[:search_title].empty?
  end

  def searching_for_location?
    return false unless params[:search_location]
    true unless params[:search_location].empty?
  end
end
