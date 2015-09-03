class Companies::JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @company = @job.company
  end
end
