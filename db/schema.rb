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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140203234226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurants", force: true do |t|
    t.string   "camis",      null: false
    t.string   "name",       null: false
    t.string   "building",   null: false
    t.string   "street",     null: false
    t.string   "zip",        null: false
    t.string   "phone"
    t.string   "cuisine",    null: false
    t.date     "inspected",  null: false
    t.string   "action"
    t.string   "violation"
    t.string   "score"
    t.string   "grade"
    t.string   "grade_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "boro",       null: false
    t.float    "lat"
    t.float    "long"
  end

  create_table "restaurants_users", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
