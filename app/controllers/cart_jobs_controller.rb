class CartJobsController < ApplicationController
  def index
    @cart_jobs = cart.jobs
  end
def create
    job = Job.find(params[:job_id])
    cart.add_job(job)
    session[:cart] = cart.data

    if request.referrer.include?("/jobs/")

      flash[:notice] = "Added to Favorites"
      redirect_to company_job_path(job.company, job)
    else
      # redirect_to root_path
      flash.now[:notice] = "Unable to add to Favorites"
      render :back
    end
  end

  def destroy
    @job = Job.find(params[:id])
    cart.remove_job(@job)
    session[:cart] = cart.data
    flash[:notice] = render_to_string partial: "flash"
    redirect_to cart_path
  end
end
