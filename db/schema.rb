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

ActiveRecord::Schema.define(version: 20170624200348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "hours"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "truck_id"
    t.integer  "user_id"
    t.float    "longitude"
    t.index ["truck_id"], name: "index_locations_on_truck_id", using: :btree
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.string   "food"
    t.string   "description"
    t.string   "price"
    t.boolean  "is_special"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "truck_id"
    t.integer  "user_id"
    t.index ["truck_id"], name: "index_menus_on_truck_id", using: :btree
    t.index ["user_id"], name: "index_menus_on_user_id", using: :btree
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "truck_name"
    t.string   "phone_number"
    t.boolean  "is_cash_only"
    t.string   "picture"
    t.string   "info"
    t.string   "category"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "truck_image_file_name"
    t.string   "truck_image_content_type"
    t.integer  "truck_image_file_size"
    t.datetime "truck_image_updated_at"
    t.index ["user_id"], name: "index_trucks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "business_name"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "logo"
    t.string   "permit_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "locations", "trucks"
  add_foreign_key "locations", "users"
  add_foreign_key "menus", "trucks"
  add_foreign_key "menus", "users"
  add_foreign_key "trucks", "users"
end
