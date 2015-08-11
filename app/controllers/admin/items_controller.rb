class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.price == 0
      flash[:error] = "Item can't be free, we've got Dino's to feed!"
      render :new
    else
      if @item.save
        flash[:message] = "Item #{@item.title} created"
        redirect_to admin_dashboard_path
      else
        flash[:error] = "All fields must be accounted for"
        render :new
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    
    flash[:message] = "Item updated"
    redirect_to admin_dashboard_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :description, :category_id)
  end
end
