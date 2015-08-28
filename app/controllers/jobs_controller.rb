class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.paginate(page: params[:page])
    if params[:search_title]
      @jobs = Job.where(id: Job.find_by_fuzzy_title(params[:search_title]).map(&:id)).paginate(page: params[:page])
    end
    
    if params[:search_location]
      @jobs = Job.where(id: Job.find_by_fuzzy_title(params[:search_location]).map(&:id)).paginate(page: params[:page])
    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
