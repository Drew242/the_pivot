class RemovePriceAndSaleIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :price
    remove_column :jobs, :sale_id
  end
end
