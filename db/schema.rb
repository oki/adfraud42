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

ActiveRecord::Schema.define(:version => 20120604174748) do

  create_table "advertisements", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "ident",      :limit => 15, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "event_type",  :limit => 1
    t.string   "targeturl"
    t.string   "ad_ident",    :limit => 15
    t.string   "uniqueuser",  :limit => 20
    t.string   "user_agent"
    t.string   "ip",          :limit => 16
    t.datetime "ad_gen_time"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "events", ["ad_ident"], :name => "index_events_on_ad_ident"
  add_index "events", ["uniqueuser"], :name => "index_events_on_uniqueuser"

end
