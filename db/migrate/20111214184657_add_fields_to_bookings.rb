class AddFieldsToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :collected_by, :integer
    add_column :bookings, :rejected_by, :integer
    add_column :bookings, :accepted_by, :integer, :default => 0
  end

  def self.down
    remove_column :bookings, :collected_by
    remove_column :bookings, :rejected_by
    remove_column :bookings, :accepted_by
  end
end
