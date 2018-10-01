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

ActiveRecord::Schema.define(version: 20181001213545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "contact_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.time "init_hour"
    t.time "final_hour"
    t.string "fb_id"
    t.string "fb_access_token"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.text "profile_pic"
    t.date "born_date"
    t.boolean "deleted"
    t.string "fb_id"
    t.string "fb_name"
    t.string "fb_profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
