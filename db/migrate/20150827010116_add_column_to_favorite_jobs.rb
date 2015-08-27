class AddColumnToFavoriteJobs < ActiveRecord::Migration
  def change
    add_reference :favorite_jobs, :job, index: true, foreign_key: true
  end
end
