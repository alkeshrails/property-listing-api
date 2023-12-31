class AddUserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :string, default: "user"
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :date
  end
end
