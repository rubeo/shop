class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :users, :email, :unique => true
    add_index :users, :login_name, :unique => true
  end

  def down
    remove_index :users, :email
    remove_index :users, :login_name
  end
end
