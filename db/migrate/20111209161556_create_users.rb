class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.string :password_hash
      t.string :password_salt
      t.string :remember_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.datetime :last_login_at
      t.datetime :last_logout_at
      t.datetime :last_activity_at
      t.integer :login_count, :default => 0
      t.string :last_login_ip
      t.string :provider
      t.string :uid
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
