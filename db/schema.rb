# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111214184657) do

  create_table "bookings", :force => true do |t|
    t.integer  "user_id"
    t.text     "pickup_address"
    t.text     "drop_address"
    t.integer  "status"
    t.integer  "pick_time_in_mins"
    t.datetime "pickup_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collected_by"
    t.integer  "rejected_by"
    t.integer  "accepted_by",       :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.integer  "login_count",            :default => 0
    t.string   "last_login_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "licence_number"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.string   "taxi_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
