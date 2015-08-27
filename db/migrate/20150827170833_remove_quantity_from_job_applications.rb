class RemoveQuantityFromJobApplications < ActiveRecord::Migration
  def change
    remove_column :job_applications, :quantity
  end
end
