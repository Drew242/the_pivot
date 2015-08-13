class Admin::SalesController < Admin::BaseController
  def index
    @sales = Sale.active
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to admin_sales_path
    else
      flash[:error] = @sale.errors.full_messages.join(", ")
    end
  end

  def end_sale
    @sale = Sale.find(params[:id])
    @sale.expire
    redirect_to admin_sales_path
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :discount)
  end
end
