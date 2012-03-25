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

ActiveRecord::Schema.define(:version => 20120325025401) do

  create_table "attendees", :force => true do |t|
    t.string   "name"
    t.decimal  "hourly_rate"
    t.string   "email"
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "position"
  end

  add_index "attendees", ["user_id"], :name => "index_attendees_on_user_id"

  create_table "attendees_groups", :id => false, :force => true do |t|
    t.integer "attendee_id"
    t.integer "group_id"
  end

  add_index "attendees_groups", ["attendee_id", "group_id"], :name => "index_attendees_groups_on_attendee_id_and_group_id"
  add_index "attendees_groups", ["group_id", "attendee_id"], :name => "index_attendees_groups_on_group_id_and_attendee_id"

  create_table "attendees_meetings", :id => false, :force => true do |t|
    t.integer "attendee_id"
    t.integer "meeting_id"
  end

  add_index "attendees_meetings", ["attendee_id", "meeting_id"], :name => "index_attendees_meetings_on_attendee_id_and_meeting_id"
  add_index "attendees_meetings", ["meeting_id", "attendee_id"], :name => "index_attendees_meetings_on_meeting_id_and_attendee_id"

  create_table "groups", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "meetings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "location"
    t.string   "agenda"
    t.decimal  "cost"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
