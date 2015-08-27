class RenameFavoriteJobsToJobApplications < ActiveRecord::Migration
  def change
    rename_table :favorite_jobs, :job_applications
  end
end
