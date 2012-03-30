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

ActiveRecord::Schema.define(:version => 20120330222256) do

  create_table "rails_adserver_adspaces", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "rails_adserver_advertisements", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "is_active"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "param_restriction"
    t.string   "param_restriction_name"
    t.integer  "adspace_id"
    t.string   "ad_type"
    t.boolean  "parameter_restriction_boolean"
    t.text     "ad_text"
    t.string   "url"
    t.boolean  "geolocation_boolean"
    t.string   "image"
    t.integer  "max_clicks"
    t.integer  "click_count"
    t.string   "geolocation_location"
    t.string   "city_name"
    t.string   "state_name"
    t.string   "country_name"
    t.boolean  "backup"
    t.integer  "max_impressions"
    t.integer  "impressions_count"
  end

  add_index "rails_adserver_advertisements", ["adspace_id"], :name => "index_rails_adserver_advertisements_on_adspace_id"
  add_index "rails_adserver_advertisements", ["city_name"], :name => "index_rails_adserver_advertisements_on_city_name"
  add_index "rails_adserver_advertisements", ["country_name"], :name => "index_rails_adserver_advertisements_on_country_name"
  add_index "rails_adserver_advertisements", ["param_restriction"], :name => "index_rails_adserver_advertisements_on_param_restriction"
  add_index "rails_adserver_advertisements", ["state_name"], :name => "index_rails_adserver_advertisements_on_state_name"

  create_table "rails_adserver_clicks", :force => true do |t|
    t.string   "ip_address"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "advertisement_id"
  end

  add_index "rails_adserver_clicks", ["advertisement_id"], :name => "index_rails_adserver_clicks_on_advertisement_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "can_manage_ads"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
