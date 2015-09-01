class Companies::Admin::JobsController < Admin::BaseController
  # class Companies::Admin::JobsController < Companies::CompaniesController

  def index
    @jobs = current_company.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @company = Company.find_by(user_id: current_user.id)

    @job = @company.jobs.new(job_params)

    if @job.save
      flash[:success] = "#{@job.title} has been created"
      redirect_to companies_admin_company_path(@company)
    else
      flash.now[:danger] = "Job creation failed!"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find_by(user_id: current_user.id)
    @job = Job.find(params[:id])

    if @job.update(job_params)
      flash[:notice] = "Job updated!"
      redirect_to companies_admin_company_path(@company)
    else
      flash[:error] = "Job update failed!"
      render :edit
    end
  end

  def status
    @company = Company.find_by(user_id: current_user.id)
    @job = @company.jobs.find(params[:job])
    if @job.active?
      @job.inactive!
    else
      @job.active!
    end
    redirect_to companies_admin_company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit([:title, :description, :location])
  end
end
