class JobsController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find_by(slug: params[:id])
    @jobs = Job.where(status: 'active').paginate(page: params[:page])
  end

  def show
    @job = Job.find(params[:id])
  end
end
