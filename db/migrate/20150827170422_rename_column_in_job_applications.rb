class RenameColumnInJobApplications < ActiveRecord::Migration
  def change
    rename_column :job_applications, :order_id, :application_id
  end
end
