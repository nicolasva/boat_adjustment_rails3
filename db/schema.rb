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

ActiveRecord::Schema.define(:version => 20130403151518) do

  create_table "adjustment_types", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "boat_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "adjustment_types", ["boat_type_id"], :name => "adjustment_types_contexts_to_boat_type"

  create_table "adjustment_types_contexts", :force => true do |t|
    t.integer "context_id"
    t.integer "adjustment_type_id"
  end

  add_index "adjustment_types_contexts", ["adjustment_type_id"], :name => "adjustment_types_contexts_to_adjustment_types"
  add_index "adjustment_types_contexts", ["context_id"], :name => "adjustment_types_contexts_context_id_to_contexts"

  create_table "adjustments", :force => true do |t|
    t.string   "name",               :null => false
    t.float    "value",              :null => false
    t.integer  "adjustment_type_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "adjustments", ["adjustment_type_id"], :name => "adjustments_type_id_to_adjustments"

  create_table "boat_types", :force => true do |t|
    t.string   "model",                   :null => false
    t.float    "length"
    t.float    "width"
    t.string   "serial_number_sail"
    t.string   "serial_number_jib_sail"
    t.string   "serial_number_spineaker"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "boat_types_sellers", :force => true do |t|
    t.integer "seller_id"
    t.integer "boat_type_id"
  end

  add_index "boat_types_sellers", ["boat_type_id"], :name => "boat_types_boat_type_id_to_boat_types"
  add_index "boat_types_sellers", ["seller_id"], :name => "boat_types_seller_id_to_sellers"

  create_table "cities", :force => true do |t|
    t.string   "name",       :default => "city", :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "contexts", :force => true do |t|
    t.string   "city",           :null => false
    t.float    "average_wind",   :null => false
    t.float    "wind_variation", :null => false
    t.float    "wind_direction", :null => false
    t.string   "sea_state",      :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "contexts_crews", :force => true do |t|
    t.integer "crew_id"
    t.integer "context_id"
  end

  add_index "contexts_crews", ["context_id"], :name => "contexts_crew_context_id_to_contexts"
  add_index "contexts_crews", ["crew_id"], :name => "contexts_crews_crew_id_to_crews"

  create_table "crews", :force => true do |t|
    t.float    "crew_weight",                :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id",     :default => 1, :null => false
  end

  add_index "crews", ["user_id"], :name => "crews_user_id_to_users"

  create_table "daytimes", :force => true do |t|
    t.datetime "day"
    t.integer  "context_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "daytimes", ["context_id"], :name => "daytimes_context_id_to_contexts"

  create_table "manufacturers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sellers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",          :null => false
    t.string   "encrypted_password",     :default => "",          :null => false
    t.string   "firstname",              :default => "Firstname", :null => false
    t.string   "lastname",               :default => "Lastname",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
