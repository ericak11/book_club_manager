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

ActiveRecord::Schema.define(version: 20160306220315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "description"
    t.string "author"
    t.string "publish_date"
    t.string "image"
    t.string "book_club_date"
  end

  create_table "events", force: :cascade do |t|
    t.string   "date"
    t.string   "time"
    t.string   "location"
    t.string   "map"
    t.integer  "partner_id"
    t.integer  "book_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", force: :cascade do |t|
    t.integer "host_id"
    t.integer "cohost_id"
    t.integer "rank"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "link"
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "member"
  end

  create_table "wines", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "type"
    t.string   "color"
    t.string   "description"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
