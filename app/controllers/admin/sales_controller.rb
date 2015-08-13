class Admin::SalesController < Admin::BaseController
  def index
    @sales = Sale.all
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

  private

  def sale_params
    params.require(:sale).permit(:name, :discount)
  end
end
