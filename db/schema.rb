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

ActiveRecord::Schema.define(version: 20181012145748) do

  create_table "campaigns", force: :cascade do |t|
    t.integer "company_id"
    t.integer "community_manager_id"
    t.string "name"
    t.text "objetive"
    t.date "init_date"
    t.date "finish_date"
    t.text "image"
    t.boolean "finished", default: false
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_manager_id"], name: "index_campaigns_on_community_manager_id"
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "campaigns_users", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "user_id"
    t.index ["campaign_id"], name: "index_campaigns_users_on_campaign_id"
    t.index ["user_id"], name: "index_campaigns_users_on_user_id"
  end

  create_table "channels", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "company_id"
    t.string "name"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_channels_on_company_id"
    t.index ["publication_id"], name: "index_channels_on_publication_id"
  end

  create_table "companies", force: :cascade do |t|
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
  end

  create_table "companies_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_companies_users_on_company_id"
    t.index ["user_id"], name: "index_companies_users_on_user_id"
  end

  create_table "companies_users_roles", force: :cascade do |t|
    t.integer "role_id"
    t.integer "companies_users_id"
    t.index ["companies_users_id"], name: "index_companies_users_roles_on_companies_users_id"
    t.index ["role_id"], name: "index_companies_users_roles_on_role_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "channel_id"
    t.text "message"
    t.boolean "seen", default: false
    t.boolean "edited", default: false
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "node_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "granter_id"
    t.integer "role_id"
    t.integer "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_node_users_on_node_id"
    t.index ["role_id"], name: "index_node_users_on_role_id"
    t.index ["user_id"], name: "index_node_users_on_user_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.integer "node_id"
    t.integer "campaign_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_nodes_on_campaign_id"
    t.index ["node_id"], name: "index_nodes_on_node_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "task_id"
    t.integer "reciever_id"
    t.integer "sender_id"
    t.text "message"
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_notifications_on_task_id"
  end

  create_table "publication_logs", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "user_id"
    t.string "content"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_publication_logs_on_publication_id"
    t.index ["user_id"], name: "index_publication_logs_on_user_id"
  end

  create_table "publication_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.integer "publication_status_id"
    t.integer "node_id"
    t.text "name"
    t.text "content"
    t.date "publication_date"
    t.boolean "published", default: false
    t.string "fb_id"
    t.integer "likes", default: 0
    t.integer "shares", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_publications_on_node_id"
    t.index ["publication_status_id"], name: "index_publications_on_publication_status_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "keyword"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword"], name: "index_roles_on_keyword", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "user_id"
    t.integer "creator_id"
    t.string "name"
    t.text "content"
    t.datetime "deadeline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_tasks_on_publication_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_creations", force: :cascade do |t|
    t.integer "user_id"
    t.string "creation_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_creations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "company_id"
    t.integer "works_on_id"
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.text "image"
    t.date "born_date"
    t.boolean "deleted", default: false
    t.string "fb_id"
    t.string "fb_name"
    t.string "fb_image"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
