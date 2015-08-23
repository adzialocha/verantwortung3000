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

ActiveRecord::Schema.define(version: 20150823214221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "instrument_id"
    t.boolean  "confirmed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "collaborations", ["event_id"], name: "index_collaborations_on_event_id", using: :btree
  add_index "collaborations", ["instrument_id"], name: "index_collaborations_on_instrument_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "event_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_categories_events", force: :cascade do |t|
    t.integer "event_category_id"
    t.integer "event_id"
  end

  add_index "event_categories_events", ["event_category_id"], name: "index_event_categories_events_on_event_category_id", using: :btree
  add_index "event_categories_events", ["event_id"], name: "index_event_categories_events_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "production_id"
    t.integer  "location_id"
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["production_id"], name: "index_events_on_production_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "src"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "instruments", ["user_id"], name: "index_instruments_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "productions", ["user_id"], name: "index_productions_on_user_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "device_id"
    t.boolean  "confirmed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "requirements", ["device_id"], name: "index_requirements_on_device_id", using: :btree
  add_index "requirements", ["event_id"], name: "index_requirements_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin"
    t.string   "image"
    t.string   "locale"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "tel"
    t.string   "street"
    t.string   "city_code"
    t.string   "city"
    t.string   "country"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "devices", "users"
  add_foreign_key "events", "locations"
  add_foreign_key "events", "productions"
  add_foreign_key "instruments", "users"
  add_foreign_key "productions", "users"
end
