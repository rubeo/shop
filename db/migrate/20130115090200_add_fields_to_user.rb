class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastName, :string
    add_column :users, :password, :string
    add_column :users, :confirmPassword, :string
    add_column :users, :email, :string
    rename_column :users, :role, :first_name
    rename_column :users, :name, :login_name
  end
end
