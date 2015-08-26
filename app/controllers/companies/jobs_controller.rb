class Companies::JobsController < Companies::CompaniesController

  def index
    @jobs = current_company.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

end
