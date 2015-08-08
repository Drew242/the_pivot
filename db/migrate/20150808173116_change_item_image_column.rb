class ChangeItemImageColumn < ActiveRecord::Migration
  def change
    change_column :items, :image, :string, default: "https://www.big-lies.org/NUKE-LIES/profile.ak.fbcdn.net/hprofile-ak-snc4/50335_2236820400_8469_n.jpg"
  end
end
