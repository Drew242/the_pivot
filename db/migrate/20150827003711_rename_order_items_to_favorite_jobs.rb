class RenameOrderItemsToFavoriteJobs < ActiveRecord::Migration
  def change
    rename_table :order_items, :favorite_jobs
  end
end
