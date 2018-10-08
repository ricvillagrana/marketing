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

ActiveRecord::Schema.define(version: 20181008182945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "community_manager_id"
    t.string "name"
    t.text "objective"
    t.date "init_date"
    t.date "finish_date"
    t.text "image"
    t.boolean "finished"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_manager_id"], name: "index_campaigns_on_community_manager_id"
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "campaigns_users", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.index ["campaign_id"], name: "index_campaigns_users_on_campaign_id"
    t.index ["user_id"], name: "index_campaigns_users_on_user_id"
  end

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
    t.text "profile_pic"
    t.date "born_date"
    t.boolean "deleted"
    t.string "fb_id"
    t.string "fb_name"
    t.string "fb_profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "campaigns", "companies"
  add_foreign_key "campaigns_users", "campaigns"
  add_foreign_key "campaigns_users", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
