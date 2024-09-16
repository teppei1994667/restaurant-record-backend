class AddNullFalseToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :name, false
  end
end
