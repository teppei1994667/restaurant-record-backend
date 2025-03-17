class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.references :user, :null => false, foreign_key: true
      t.string :store_name, :null => false
      t.string :telephone_number
      t.string :address
      t.integer :seating_capacity
      t.decimal :area, precision: 6, scale: 2

      t.timestamps
    end
  end
end
