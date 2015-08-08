class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:message] = "Item #{@item.title} created"
      redirect_to admin_dashboard_path
    else
      flash[:error] = "Check the fields and try again"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :description)
  end
end
