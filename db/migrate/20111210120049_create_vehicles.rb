class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :name
      t.string :taxi_number
      t.integer :user_id
      t.timestamps
    end
    add_column :users, :licence_number, :string
  end

  def self.down
    drop_table :vehicles
    remove_column :users, :licence_number
  end
end
