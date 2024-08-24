class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
