class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :administrator, :default => "Administrator"
      t.string :merchandiser, :default => "Merchandiser"
      t.string :supervisor, :default => "Supervisor"
      t.string :customer, :default => "Customer"

      t.timestamps
    end
  end
end
