class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if current_user.company.nil? && @company.save
      current_user.company = @company
      current_user.roles << Role.find_by(name: "company_admin")
      flash[:success] = "#{@company.name} has been created"
      redirect_to root_path
    else
      flash.now[:danger] = "There was a problem creating #{@company.name}, you may only have one company."
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :information)
  end

end
