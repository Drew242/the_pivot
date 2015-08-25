class RemoveImageFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :image
  end
end
