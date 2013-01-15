class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :north, :default => "North"
      t.string :south, :default => "South"
      t.string :west, :default => "West"
      t.string :east, :default => "East"

      t.timestamps
    end
  end
end
