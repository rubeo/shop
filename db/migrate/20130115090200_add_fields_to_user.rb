class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    #add_column :users, :password, :string
    #add_column :users, :password_confirmation, :string
    add_column :users, :email, :string
    add_column :users, :first_name, :string
  end
end
