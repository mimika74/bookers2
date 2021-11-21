class AddUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user, :string
    add_index :users, :name, unique: true
  end
end
