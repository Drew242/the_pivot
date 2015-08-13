class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :discount
      t.integer :status, default: 0

      t.timestamps null: false
    end

    change_table :items do |t|
      t.references :sale, index: true, foreign_key: true
    end
  end
end
