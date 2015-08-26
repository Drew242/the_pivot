class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.all
    if params[:search_title]
      @jobs = @jobs.where("title = ?", params[:search_title])
    end
    if params[:search_location]
      @jobs = @jobs.where("location = ?", params[:search_location])
    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
