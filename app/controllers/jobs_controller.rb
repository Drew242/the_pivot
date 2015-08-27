class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.paginate(page: params[:page])
    if params[:search_title]
      @jobs = Job.find_by_fuzzy_title(params[:search_title])
    end
    if params[:search_location]
      @jobs += Job.find_by_fuzzy_location(params[:search_location])
    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
