class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :user_id
      t.text :pickup_address
      t.text :drop_address
      t.integer :status
      t.integer :pick_time_in_mins
      t.datetime :pickup_time
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
