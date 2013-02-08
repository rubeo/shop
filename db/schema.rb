# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130208101733) do

  create_table "items", :force => true do |t|
    t.string   "item_name"
    t.string   "item_description"
    t.decimal  "price"
    t.string   "dimension"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "itemstables", :force => true do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "price_per_line"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "order_id"
  end

  add_index "itemstables", ["item_id"], :name => "index_itemstables_on_item_id"

  create_table "orders", :force => true do |t|
    t.string   "order_number"
    t.decimal  "total_price"
    t.integer  "total_num_of_items"
    t.decimal  "max_discount"
    t.date     "delivery_date"
    t.string   "status"
    t.integer  "user_id"
    t.string   "role"
    t.date     "date_of_ordering"
    t.date     "pref_delivery_date"
    t.string   "credit_card_type"
    t.string   "credit_card_number"
    t.string   "cvv2"
    t.date     "expiry_date"
    t.date     "start_date"
    t.string   "issue_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "last_name"
    t.string   "email"
    t.string   "first_name"
    t.string   "region"
    t.string   "role"
    t.string   "login_name",             :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.datetime "locked_at"
  end

  add_index "users", ["login_name"], :name => "index_users_on_login_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
