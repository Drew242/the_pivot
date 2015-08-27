# class Admin::SalesController < Admin::BaseController
#   def index
#     @sales = Sale.active
#   end
#
#   def new
#     @sale = Sale.new
#   end
#
#   def create
#     params[:sale][:items].each do |item|
#       valid_item = Item.find(item.to_i) if item != ""
#       if valid_item
#         valid_item.create_sale(sale_params)
#         valid_item.update_attribute(:sale_id, Sale.last.id)
#       end
#     end
#     redirect_to admin_sales_path
#   end
#
#   def end_sale
#     @sale = Sale.find(params[:id])
#     @sale.expire
#     redirect_to admin_sales_path
#   end
#
#   private
#
#   def sale_params
#     params.require(:sale).permit(:name, :discount, :items)
#   end
# end
