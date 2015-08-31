class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.paginate(page: params[:page])
    unless params[:search_title].empty?
      @jobs = Job.where(id: Job.find_by_fuzzy_title(params[:search_title]).map(&:id)).paginate(page: params[:page])
    end

    unless params[:search_location].empty?
      @jobs = Job.where(id: Job.find_by_fuzzy_location(params[:search_location]).map(&:id)).paginate(page: params[:page])
    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
