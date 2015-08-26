class JobsController < ApplicationController
  def index
    @categories = Category.all
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end
end
