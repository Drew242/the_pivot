class CartJobsController < ApplicationController

  def index
    if cart.jobs.empty?
      flash[:danger] = "Please add some jobs to your favorites"
      redirect_to jobs_path
    else
      @cart_jobs = cart.jobs
    end
  end

  def create
    job = Job.find(params[:job_id])
    cart.add_job(job)
    session[:cart] = cart.data

    if request.referrer.include?("/jobs/")

      flash[:success] = "Added to Favorites"
      redirect_to company_job_path(job.company, job)
    else
      flash.now[:danger] = "Unable to add to Favorites"
      render :back
    end
  end

  def destroy
    @job = Job.find(params[:id])
    cart.remove_job(@job)
    session[:cart] = cart.data
    flash[:danger] = render_to_string partial: "flash"
    redirect_to cart_path
  end
end
