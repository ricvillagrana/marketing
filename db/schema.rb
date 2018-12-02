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

ActiveRecord::Schema.define(version: 2018_12_02_013317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "base_import_import", id: :serial, comment: "base_import.import", force: :cascade do |t|
    t.string "res_model", comment: "Model"
    t.binary "file", comment: "File"
    t.string "file_name", comment: "File Name"
    t.string "file_type", comment: "File Type"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char", id: :serial, comment: "base_import.tests.models.char", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char_noreadonly", id: :serial, comment: "base_import.tests.models.char.noreadonly", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char_readonly", id: :serial, comment: "base_import.tests.models.char.readonly", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char_required", id: :serial, comment: "base_import.tests.models.char.required", force: :cascade do |t|
    t.string "value", null: false, comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char_states", id: :serial, comment: "base_import.tests.models.char.states", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_char_stillreadonly", id: :serial, comment: "base_import.tests.models.char.stillreadonly", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_m2o", id: :serial, comment: "base_import.tests.models.m2o", force: :cascade do |t|
    t.integer "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_m2o_related", id: :serial, comment: "base_import.tests.models.m2o.related", force: :cascade do |t|
    t.integer "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_m2o_required", id: :serial, comment: "base_import.tests.models.m2o.required", force: :cascade do |t|
    t.integer "value", null: false, comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_m2o_required_related", id: :serial, comment: "base_import.tests.models.m2o.required.related", force: :cascade do |t|
    t.integer "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_o2m", id: :serial, comment: "base_import.tests.models.o2m", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_o2m_child", id: :serial, comment: "base_import.tests.models.o2m.child", force: :cascade do |t|
    t.integer "parent_id", comment: "Parent"
    t.integer "value", comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_import_tests_models_preview", id: :serial, comment: "base_import.tests.models.preview", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.integer "somevalue", null: false, comment: "Some Value"
    t.integer "othervalue", comment: "Other Variable"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_language_export", id: :serial, comment: "base.language.export", force: :cascade do |t|
    t.string "name", comment: "File Name"
    t.string "lang", null: false, comment: "Language"
    t.string "format", null: false, comment: "File Format"
    t.binary "data", comment: "File"
    t.string "state", comment: "State"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_language_import", id: :serial, comment: "Language Import", force: :cascade do |t|
    t.string "name", null: false, comment: "Language Name"
    t.string "code", limit: 5, null: false, comment: "ISO Code"
    t.binary "data", null: false, comment: "File"
    t.string "filename", null: false, comment: "File Name"
    t.boolean "overwrite", comment: "Overwrite Existing Terms"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_language_install", id: :serial, comment: "Install Language", force: :cascade do |t|
    t.string "lang", null: false, comment: "Language"
    t.boolean "overwrite", comment: "Overwrite Existing Terms"
    t.string "state", comment: "Status"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_module_uninstall", id: :serial, comment: "Module Uninstallation", force: :cascade do |t|
    t.boolean "show_all", comment: "Show All"
    t.integer "module_id", null: false, comment: "Module"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_module_update", id: :serial, comment: "Update Module", force: :cascade do |t|
    t.integer "updated", comment: "Number of modules updated"
    t.integer "added", comment: "Number of modules added"
    t.string "state", comment: "Status"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_module_upgrade", id: :serial, comment: "Module Upgrade", force: :cascade do |t|
    t.text "module_info", comment: "Apps to Update"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "base_update_translations", id: :serial, comment: "base.update.translations", force: :cascade do |t|
    t.string "lang", null: false, comment: "Language"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "community_manager_id"
    t.string "name"
    t.text "objetive"
    t.date "init_date"
    t.date "finish_date"
    t.boolean "finished", default: false
    t.boolean "deleted", default: false
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

  create_table "change_password_user", id: :serial, comment: "Change Password Wizard User", force: :cascade do |t|
    t.integer "wizard_id", null: false, comment: "Wizard"
    t.integer "user_id", null: false, comment: "User"
    t.string "user_login", comment: "User Login"
    t.string "new_passwd", comment: "New Password"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "change_password_wizard", id: :serial, comment: "Change Password Wizard", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "channels", force: :cascade do |t|
    t.bigint "publication_id"
    t.bigint "company_id"
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
    t.string "facebook_data"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_companies_users_on_company_id"
    t.index ["user_id"], name: "index_companies_users_on_user_id"
  end

  create_table "iap_account", id: :serial, comment: "iap.account", force: :cascade do |t|
    t.string "service_name", comment: "Service Name"
    t.string "account_token", comment: "Account Token"
    t.integer "company_id", comment: "Company"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_act_client", id: :integer, default: -> { "nextval('ir_actions_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "help"
    t.integer "binding_model_id"
    t.string "binding_type", null: false
    t.integer "create_uid"
    t.datetime "create_date"
    t.integer "write_uid"
    t.datetime "write_date"
    t.string "tag", null: false, comment: "Client action tag"
    t.string "target", comment: "Target Window"
    t.string "res_model", comment: "Destination Model"
    t.string "context", null: false, comment: "Context Value"
    t.binary "params_store", comment: "Params storage"
  end

  create_table "ir_act_report_xml", id: :integer, default: -> { "nextval('ir_actions_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "help"
    t.integer "binding_model_id"
    t.string "binding_type", null: false
    t.integer "create_uid"
    t.datetime "create_date"
    t.integer "write_uid"
    t.datetime "write_date"
    t.string "model", null: false, comment: "Model"
    t.string "report_type", null: false, comment: "Report Type"
    t.string "report_name", null: false, comment: "Template Name"
    t.string "report_file", comment: "Report File"
    t.boolean "multi", comment: "On Multiple Doc."
    t.integer "paperformat_id", comment: "Paper format"
    t.string "print_report_name", comment: "Printed Report Name"
    t.boolean "attachment_use", comment: "Reload from Attachment"
    t.string "attachment", comment: "Save as Attachment Prefix"
  end

  create_table "ir_act_server", id: :integer, default: -> { "nextval('ir_actions_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "help"
    t.integer "binding_model_id"
    t.string "binding_type", null: false
    t.integer "create_uid"
    t.datetime "create_date"
    t.integer "write_uid"
    t.datetime "write_date"
    t.string "usage", null: false, comment: "Usage"
    t.string "state", null: false, comment: "Action To Do"
    t.integer "sequence", comment: "Sequence"
    t.integer "model_id", null: false, comment: "Model"
    t.string "model_name", comment: "Model"
    t.text "code", comment: "Python Code"
    t.integer "crud_model_id", comment: "Create/Write Target Model"
    t.integer "link_field_id", comment: "Link using field"
  end

  create_table "ir_act_url", id: :integer, default: -> { "nextval('ir_actions_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "help"
    t.integer "binding_model_id"
    t.string "binding_type", null: false
    t.integer "create_uid"
    t.datetime "create_date"
    t.integer "write_uid"
    t.datetime "write_date"
    t.text "url", null: false, comment: "Action URL"
    t.string "target", null: false, comment: "Action Target"
  end

  create_table "ir_act_window", id: :integer, default: -> { "nextval('ir_actions_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.text "help"
    t.integer "binding_model_id"
    t.string "binding_type", null: false
    t.integer "create_uid"
    t.datetime "create_date"
    t.integer "write_uid"
    t.datetime "write_date"
    t.integer "view_id", comment: "View Ref."
    t.string "domain", comment: "Domain Value"
    t.string "context", null: false, comment: "Context Value"
    t.integer "res_id", comment: "Record ID"
    t.string "res_model", null: false, comment: "Destination Model"
    t.string "src_model", comment: "Source Model"
    t.string "target", comment: "Target Window"
    t.string "view_mode", null: false, comment: "View Mode"
    t.string "view_type", null: false, comment: "View Type"
    t.string "usage", comment: "Action Usage"
    t.integer "limit", comment: "Limit"
    t.integer "search_view_id", comment: "Search View Ref."
    t.boolean "filter", comment: "Filter"
    t.boolean "auto_search", comment: "Auto Search"
    t.boolean "multi", comment: "Restrict to lists"
  end

  create_table "ir_act_window_group_rel", id: false, comment: "RELATION BETWEEN ir_act_window AND res_groups", force: :cascade do |t|
    t.integer "act_id", null: false
    t.integer "gid", null: false
    t.index ["act_id", "gid"], name: "ir_act_window_group_rel_act_id_gid_key", unique: true
    t.index ["act_id"], name: "ir_act_window_group_rel_act_id_idx"
    t.index ["gid"], name: "ir_act_window_group_rel_gid_idx"
  end

  create_table "ir_act_window_view", id: :serial, comment: "ir.actions.act_window.view", force: :cascade do |t|
    t.integer "sequence", comment: "Sequence"
    t.integer "view_id", comment: "View"
    t.string "view_mode", null: false, comment: "View Type"
    t.integer "act_window_id", comment: "Action"
    t.boolean "multi", comment: "On Multiple Doc."
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["act_window_id", "view_mode"], name: "act_window_view_unique_mode_per_action", unique: true
  end

  create_table "ir_actions", id: :serial, force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "type", null: false, comment: "Action Type"
    t.text "help", comment: "Action Description"
    t.integer "binding_model_id", comment: "Binding Model"
    t.string "binding_type", null: false, comment: "Binding Type"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_actions_todo", id: :serial, comment: "Configuration Wizards", force: :cascade do |t|
    t.integer "action_id", null: false, comment: "Action"
    t.integer "sequence", comment: "Sequence"
    t.string "state", null: false, comment: "Status"
    t.string "name", comment: "Name"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["action_id"], name: "ir_actions_todo_action_id_index"
  end

  create_table "ir_attachment", id: :serial, comment: "ir.attachment", force: :cascade do |t|
    t.string "name", null: false, comment: "Attachment Name"
    t.string "datas_fname", comment: "File Name"
    t.text "description", comment: "Description"
    t.string "res_name", comment: "Resource Name"
    t.string "res_model", comment: "Resource Model"
    t.string "res_field", comment: "Resource Field"
    t.integer "res_id", comment: "Resource ID"
    t.datetime "create_date", comment: "Date Created"
    t.integer "create_uid", comment: "Owner"
    t.integer "company_id", comment: "Company"
    t.string "type", null: false, comment: "Type"
    t.string "url", limit: 1024, comment: "Url"
    t.boolean "public", comment: "Is public document"
    t.string "access_token", comment: "Access Token"
    t.binary "db_datas", comment: "Database Data"
    t.string "store_fname", comment: "Stored Filename"
    t.integer "file_size", comment: "File Size"
    t.string "checksum", limit: 40, comment: "Checksum/SHA1"
    t.string "mimetype", comment: "Mime Type"
    t.text "index_content", comment: "Indexed Content"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["checksum"], name: "ir_attachment_checksum_index"
    t.index ["res_model", "res_id"], name: "ir_attachment_res_idx"
    t.index ["url"], name: "ir_attachment_url_index"
  end

  create_table "ir_config_parameter", id: :serial, comment: "ir.config_parameter", force: :cascade do |t|
    t.string "key", null: false, comment: "Key"
    t.text "value", null: false, comment: "Value"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["key"], name: "ir_config_parameter_key_index"
    t.index ["key"], name: "ir_config_parameter_key_uniq", unique: true
  end

  create_table "ir_cron", id: :serial, comment: "Scheduled Actions", force: :cascade do |t|
    t.integer "ir_actions_server_id", null: false, comment: "Server action"
    t.string "cron_name", comment: "Name"
    t.integer "user_id", null: false, comment: "Scheduler User"
    t.boolean "active", comment: "Active"
    t.integer "interval_number", comment: "Interval Number"
    t.string "interval_type", comment: "Interval Unit"
    t.integer "numbercall", comment: "Number of Calls"
    t.boolean "doall", comment: "Repeat Missed"
    t.datetime "nextcall", null: false, comment: "Next Execution Date"
    t.integer "priority", comment: "Priority"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_default", id: :serial, comment: "ir.default", force: :cascade do |t|
    t.integer "field_id", null: false, comment: "Field"
    t.integer "user_id", comment: "User"
    t.integer "company_id", comment: "Company"
    t.string "condition", comment: "Condition"
    t.string "json_value", null: false, comment: "Default Value (JSON format)"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["company_id"], name: "ir_default_company_id_index"
    t.index ["field_id"], name: "ir_default_field_id_index"
    t.index ["user_id"], name: "ir_default_user_id_index"
  end

  create_table "ir_exports", id: :serial, comment: "ir.exports", force: :cascade do |t|
    t.string "name", comment: "Export Name"
    t.string "resource", comment: "Resource"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["resource"], name: "ir_exports_resource_index"
  end

  create_table "ir_exports_line", id: :serial, comment: "ir.exports.line", force: :cascade do |t|
    t.string "name", comment: "Field Name"
    t.integer "export_id", comment: "Export"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["export_id"], name: "ir_exports_line_export_id_index"
  end

  create_table "ir_filters", id: :serial, comment: "Filters", force: :cascade do |t|
    t.string "name", null: false, comment: "Filter Name"
    t.integer "user_id", comment: "User"
    t.text "domain", null: false, comment: "Domain"
    t.text "context", null: false, comment: "Context"
    t.text "sort", null: false, comment: "Sort"
    t.string "model_id", null: false, comment: "Model"
    t.boolean "is_default", comment: "Default Filter"
    t.integer "action_id", comment: "Action"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index "lower((name)::text), model_id, COALESCE(user_id, '-1'::integer), COALESCE(action_id, '-1'::integer)", name: "ir_filters_name_model_uid_unique_action_index", unique: true
    t.index ["name", "model_id", "user_id", "action_id"], name: "ir_filters_name_model_uid_unique", unique: true
  end

  create_table "ir_logging", id: :serial, comment: "ir.logging", force: :cascade do |t|
    t.datetime "create_date", comment: "Create Date"
    t.integer "create_uid", comment: "Uid"
    t.string "name", null: false, comment: "Name"
    t.string "type", null: false, comment: "Type"
    t.string "dbname", comment: "Database Name"
    t.string "level", comment: "Level"
    t.text "message", null: false, comment: "Message"
    t.string "path", null: false, comment: "Path"
    t.string "func", null: false, comment: "Function"
    t.string "line", null: false, comment: "Line"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["dbname"], name: "ir_logging_dbname_index"
    t.index ["level"], name: "ir_logging_level_index"
    t.index ["type"], name: "ir_logging_type_index"
  end

  create_table "ir_mail_server", id: :serial, comment: "ir.mail_server", force: :cascade do |t|
    t.string "name", null: false, comment: "Description"
    t.string "smtp_host", null: false, comment: "SMTP Server"
    t.integer "smtp_port", null: false, comment: "SMTP Port"
    t.string "smtp_user", comment: "Username"
    t.string "smtp_pass", comment: "Password"
    t.string "smtp_encryption", null: false, comment: "Connection Security"
    t.boolean "smtp_debug", comment: "Debugging"
    t.integer "sequence", comment: "Priority"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["name"], name: "ir_mail_server_name_index"
  end

  create_table "ir_model", id: :serial, comment: "Models", force: :cascade do |t|
    t.string "name", null: false, comment: "Model Description"
    t.string "model", null: false, comment: "Model"
    t.text "info", comment: "Information"
    t.string "state", comment: "Type"
    t.boolean "transient", comment: "Transient Model"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["model"], name: "ir_model_model_index"
    t.index ["model"], name: "ir_model_obj_name_uniq", unique: true
  end

  create_table "ir_model_access", id: :serial, comment: "ir.model.access", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.boolean "active", comment: "Active"
    t.integer "model_id", null: false, comment: "Object"
    t.integer "group_id", comment: "Group"
    t.boolean "perm_read", comment: "Read Access"
    t.boolean "perm_write", comment: "Write Access"
    t.boolean "perm_create", comment: "Create Access"
    t.boolean "perm_unlink", comment: "Delete Access"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["group_id"], name: "ir_model_access_group_id_index"
    t.index ["model_id"], name: "ir_model_access_model_id_index"
    t.index ["name"], name: "ir_model_access_name_index"
  end

  create_table "ir_model_constraint", id: :serial, comment: "ir.model.constraint", force: :cascade do |t|
    t.string "name", null: false, comment: "Constraint"
    t.string "definition", comment: "Definition"
    t.integer "model", null: false, comment: "Model"
    t.integer "module", null: false, comment: "Module"
    t.string "type", limit: 1, null: false, comment: "Constraint Type"
    t.datetime "date_update", comment: "Update Date"
    t.datetime "date_init", comment: "Initialization Date"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["model"], name: "ir_model_constraint_model_index"
    t.index ["module"], name: "ir_model_constraint_module_index"
    t.index ["name", "module"], name: "ir_model_constraint_module_name_uniq", unique: true
    t.index ["name"], name: "ir_model_constraint_name_index"
    t.index ["type"], name: "ir_model_constraint_type_index"
  end

  create_table "ir_model_data", id: :serial, force: :cascade do |t|
    t.integer "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer "write_uid"
    t.boolean "noupdate"
    t.string "name", null: false
    t.datetime "date_init"
    t.datetime "date_update"
    t.string "module", null: false
    t.string "model", null: false
    t.integer "res_id"
    t.index ["model", "res_id"], name: "ir_model_data_model_res_id_index"
    t.index ["module", "name"], name: "ir_model_data_module_name_uniq_index", unique: true
  end

  create_table "ir_model_fields", id: :serial, comment: "Fields", force: :cascade do |t|
    t.string "name", null: false, comment: "Field Name"
    t.string "complete_name", comment: "Complete Name"
    t.string "model", null: false, comment: "Object Name"
    t.string "relation", comment: "Object Relation"
    t.string "relation_field", comment: "Relation Field"
    t.integer "model_id", null: false, comment: "Model"
    t.string "field_description", null: false, comment: "Field Label"
    t.text "help", comment: "Field Help"
    t.string "ttype", null: false, comment: "Field Type"
    t.string "selection", comment: "Selection Options"
    t.boolean "copy", comment: "Copied"
    t.string "related", comment: "Related Field"
    t.boolean "required", comment: "Required"
    t.boolean "readonly", comment: "Readonly"
    t.boolean "index", comment: "Indexed"
    t.boolean "translate", comment: "Translatable"
    t.integer "size", comment: "Size"
    t.string "state", null: false, comment: "Type"
    t.string "on_delete", comment: "On Delete"
    t.string "domain", comment: "Domain"
    t.boolean "selectable", comment: "Selectable"
    t.string "relation_table", comment: "Relation Table"
    t.string "column1", comment: "Column 1"
    t.string "column2", comment: "Column 2"
    t.text "compute", comment: "Compute"
    t.string "depends", comment: "Dependencies"
    t.boolean "store", comment: "Stored"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["complete_name"], name: "ir_model_fields_complete_name_index"
    t.index ["model", "name"], name: "ir_model_fields_name_unique", unique: true
    t.index ["model"], name: "ir_model_fields_model_index"
    t.index ["model_id"], name: "ir_model_fields_model_id_index"
    t.index ["name"], name: "ir_model_fields_name_index"
    t.index ["state"], name: "ir_model_fields_state_index"
  end

  create_table "ir_model_fields_group_rel", id: false, comment: "RELATION BETWEEN ir_model_fields AND res_groups", force: :cascade do |t|
    t.integer "field_id", null: false
    t.integer "group_id", null: false
    t.index ["field_id", "group_id"], name: "ir_model_fields_group_rel_field_id_group_id_key", unique: true
    t.index ["field_id"], name: "ir_model_fields_group_rel_field_id_idx"
    t.index ["group_id"], name: "ir_model_fields_group_rel_group_id_idx"
  end

  create_table "ir_model_relation", id: :serial, comment: "ir.model.relation", force: :cascade do |t|
    t.string "name", null: false, comment: "Relation Name"
    t.integer "model", null: false, comment: "Model"
    t.integer "module", null: false, comment: "Module"
    t.datetime "date_update", comment: "Update Date"
    t.datetime "date_init", comment: "Initialization Date"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["model"], name: "ir_model_relation_model_index"
    t.index ["module"], name: "ir_model_relation_module_index"
    t.index ["name"], name: "ir_model_relation_name_index"
  end

  create_table "ir_module_category", id: :serial, force: :cascade do |t|
    t.integer "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer "write_uid"
    t.integer "parent_id"
    t.string "name", null: false
    t.text "description", comment: "Description"
    t.integer "sequence", comment: "Sequence"
    t.boolean "visible", comment: "Visible"
    t.boolean "exclusive", comment: "Exclusive"
    t.index ["name"], name: "ir_module_category_name_index"
    t.index ["parent_id"], name: "ir_module_category_parent_id_index"
  end

  create_table "ir_module_module", id: :serial, force: :cascade do |t|
    t.integer "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer "write_uid"
    t.string "website"
    t.string "summary"
    t.string "name", null: false
    t.string "author"
    t.string "icon"
    t.string "state", limit: 16
    t.string "latest_version"
    t.string "shortdesc"
    t.integer "category_id"
    t.text "description"
    t.boolean "application", default: false
    t.boolean "demo", default: false
    t.boolean "web", default: false
    t.string "license", limit: 32
    t.integer "sequence", default: 100
    t.boolean "auto_install", default: false
    t.string "maintainer", comment: "Maintainer"
    t.text "contributors", comment: "Contributors"
    t.string "published_version", comment: "Published Version"
    t.string "url", comment: "URL"
    t.text "menus_by_module", comment: "Menus"
    t.text "reports_by_module", comment: "Reports"
    t.text "views_by_module", comment: "Views"
    t.index ["category_id"], name: "ir_module_module_category_id_index"
    t.index ["name"], name: "ir_module_module_name_index"
    t.index ["name"], name: "ir_module_module_name_uniq", unique: true
    t.index ["name"], name: "name_uniq", unique: true
    t.index ["state"], name: "ir_module_module_state_index"
  end

  create_table "ir_module_module_dependency", id: :serial, force: :cascade do |t|
    t.integer "create_uid"
    t.datetime "create_date"
    t.datetime "write_date"
    t.integer "write_uid"
    t.string "name"
    t.integer "module_id"
    t.index ["name"], name: "ir_module_module_dependency_name_index"
  end

  create_table "ir_module_module_exclusion", id: :serial, comment: "Module exclusion", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.integer "module_id", comment: "Module"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["name"], name: "ir_module_module_exclusion_name_index"
  end

  create_table "ir_property", id: :serial, comment: "ir.property", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.string "res_id", comment: "Resource"
    t.integer "company_id", comment: "Company"
    t.integer "fields_id", null: false, comment: "Field"
    t.float "value_float", comment: "Value Float"
    t.integer "value_integer", comment: "Value Integer"
    t.text "value_text", comment: "Value Text"
    t.binary "value_binary", comment: "Value Binary"
    t.string "value_reference", comment: "Value Reference"
    t.datetime "value_datetime", comment: "Value Datetime"
    t.string "type", null: false, comment: "Type"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["company_id"], name: "ir_property_company_id_index"
    t.index ["fields_id"], name: "ir_property_fields_id_index"
    t.index ["name"], name: "ir_property_name_index"
    t.index ["res_id"], name: "ir_property_res_id_index"
    t.index ["type"], name: "ir_property_type_index"
  end

  create_table "ir_rule", id: :serial, comment: "ir.rule", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.boolean "active", comment: "Active"
    t.integer "model_id", null: false, comment: "Object"
    t.text "domain_force", comment: "Domain"
    t.boolean "perm_read", comment: "Apply for Read"
    t.boolean "perm_write", comment: "Apply for Write"
    t.boolean "perm_create", comment: "Apply for Create"
    t.boolean "perm_unlink", comment: "Apply for Delete"
    t.boolean "global", comment: "Global"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["model_id"], name: "ir_rule_model_id_index"
    t.index ["name"], name: "ir_rule_name_index"
  end

  create_table "ir_sequence", id: :serial, comment: "ir.sequence", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "code", comment: "Sequence Code"
    t.string "implementation", null: false, comment: "Implementation"
    t.boolean "active", comment: "Active"
    t.string "prefix", comment: "Prefix"
    t.string "suffix", comment: "Suffix"
    t.integer "number_next", null: false, comment: "Next Number"
    t.integer "number_increment", null: false, comment: "Step"
    t.integer "padding", null: false, comment: "Sequence Size"
    t.integer "company_id", comment: "Company"
    t.boolean "use_date_range", comment: "Use subsequences per date_range"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_sequence_date_range", id: :serial, comment: "ir.sequence.date_range", force: :cascade do |t|
    t.date "date_from", null: false, comment: "From"
    t.date "date_to", null: false, comment: "To"
    t.integer "sequence_id", null: false, comment: "Main Sequence"
    t.integer "number_next", null: false, comment: "Next Number"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_server_object_lines", id: :serial, comment: "Server Action value mapping", force: :cascade do |t|
    t.integer "server_id", comment: "Related Server Action"
    t.integer "col1", null: false, comment: "Field"
    t.text "value", null: false, comment: "Value"
    t.string "type", null: false, comment: "Evaluation Type"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "ir_translation", id: :serial, comment: "ir.translation", force: :cascade do |t|
    t.string "name", null: false, comment: "Translated field"
    t.integer "res_id", comment: "Record ID"
    t.string "lang", comment: "Language"
    t.string "type", comment: "Type"
    t.text "src", comment: "Internal Source"
    t.text "value", comment: "Translation Value"
    t.string "module", comment: "Module"
    t.string "state", comment: "Status"
    t.text "comments", comment: "Translation comments"
    t.index "md5(src)", name: "ir_translation_src_md5"
    t.index ["comments"], name: "ir_translation_comments_index"
    t.index ["module"], name: "ir_translation_module_index"
    t.index ["name", "lang", "type"], name: "ir_translation_ltn"
    t.index ["res_id"], name: "ir_translation_res_id_index"
    t.index ["type"], name: "ir_translation_type_index"
  end

  create_table "ir_ui_menu", id: :serial, comment: "ir.ui.menu", force: :cascade do |t|
    t.integer "parent_left"
    t.integer "parent_right"
    t.string "name", null: false, comment: "Menu"
    t.boolean "active", comment: "Active"
    t.integer "sequence", comment: "Sequence"
    t.integer "parent_id", comment: "Parent Menu"
    t.string "web_icon", comment: "Web Icon File"
    t.string "action", comment: "Action"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["parent_id"], name: "ir_ui_menu_parent_id_index"
    t.index ["parent_left"], name: "ir_ui_menu_parent_left_index"
    t.index ["parent_right"], name: "ir_ui_menu_parent_right_index"
  end

  create_table "ir_ui_menu_group_rel", id: false, comment: "RELATION BETWEEN ir_ui_menu AND res_groups", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "gid", null: false
    t.index ["gid"], name: "ir_ui_menu_group_rel_gid_idx"
    t.index ["menu_id", "gid"], name: "ir_ui_menu_group_rel_menu_id_gid_key", unique: true
    t.index ["menu_id"], name: "ir_ui_menu_group_rel_menu_id_idx"
  end

  create_table "ir_ui_view", id: :serial, comment: "ir.ui.view", force: :cascade do |t|
    t.string "name", null: false, comment: "View Name"
    t.string "model", comment: "Model"
    t.string "key", comment: "Key"
    t.integer "priority", null: false, comment: "Sequence"
    t.string "type", comment: "View Type"
    t.text "arch_db", comment: "Arch Blob"
    t.string "arch_fs", comment: "Arch Filename"
    t.integer "inherit_id", comment: "Inherited View"
    t.string "field_parent", comment: "Child Field"
    t.datetime "create_date", comment: "Create Date"
    t.datetime "write_date", comment: "Last Modification Date"
    t.string "mode", null: false, comment: "View inheritance mode"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.integer "write_uid", comment: "Last Updated by"
    t.index ["inherit_id"], name: "ir_ui_view_inherit_id_index"
    t.index ["model", "inherit_id"], name: "ir_ui_view_model_type_inherit_id"
    t.index ["model"], name: "ir_ui_view_model_index"
  end

  create_table "ir_ui_view_custom", id: :serial, comment: "ir.ui.view.custom", force: :cascade do |t|
    t.integer "ref_id", null: false, comment: "Original View"
    t.integer "user_id", null: false, comment: "User"
    t.text "arch", null: false, comment: "View Architecture"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["ref_id"], name: "ir_ui_view_custom_ref_id_index"
    t.index ["user_id", "ref_id"], name: "ir_ui_view_custom_user_id_ref_id"
    t.index ["user_id"], name: "ir_ui_view_custom_user_id_index"
  end

  create_table "ir_ui_view_group_rel", id: false, comment: "RELATION BETWEEN ir_ui_view AND res_groups", force: :cascade do |t|
    t.integer "view_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "ir_ui_view_group_rel_group_id_idx"
    t.index ["view_id", "group_id"], name: "ir_ui_view_group_rel_view_id_group_id_key", unique: true
    t.index ["view_id"], name: "ir_ui_view_group_rel_view_id_idx"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "channel_id"
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
    t.bigint "user_id"
    t.integer "granter_id"
    t.bigint "role_id"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_node_users_on_node_id"
    t.index ["role_id"], name: "index_node_users_on_role_id"
    t.index ["user_id"], name: "index_node_users_on_user_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "campaign_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_nodes_on_campaign_id"
    t.index ["node_id"], name: "index_nodes_on_node_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "task_id"
    t.integer "reciever_id"
    t.integer "sender_id"
    t.text "message"
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_notifications_on_task_id"
  end

  create_table "publication_logs", force: :cascade do |t|
    t.bigint "publication_id"
    t.bigint "user_id"
    t.string "content"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_publication_logs_on_publication_id"
    t.index ["user_id"], name: "index_publication_logs_on_user_id"
  end

  create_table "publication_messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "publication_id"
    t.text "message"
    t.boolean "seen"
    t.boolean "edited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_publication_messages_on_publication_id"
    t.index ["user_id"], name: "index_publication_messages_on_user_id"
  end

  create_table "publication_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.bigint "publication_status_id"
    t.bigint "node_id"
    t.text "name"
    t.text "content"
    t.date "publication_date"
    t.boolean "published", default: false
    t.string "fb_id"
    t.integer "likes", default: 0
    t.integer "shares", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images"
    t.index ["node_id"], name: "index_publications_on_node_id"
    t.index ["publication_status_id"], name: "index_publications_on_publication_status_id"
  end

  create_table "rel_modules_langexport", id: false, comment: "RELATION BETWEEN base_language_export AND ir_module_module", force: :cascade do |t|
    t.integer "wiz_id", null: false
    t.integer "module_id", null: false
    t.index ["module_id"], name: "rel_modules_langexport_module_id_idx"
    t.index ["wiz_id", "module_id"], name: "rel_modules_langexport_wiz_id_module_id_key", unique: true
    t.index ["wiz_id"], name: "rel_modules_langexport_wiz_id_idx"
  end

  create_table "rel_server_actions", id: false, comment: "RELATION BETWEEN ir_act_server AND ir_act_server", force: :cascade do |t|
    t.integer "server_id", null: false
    t.integer "action_id", null: false
    t.index ["action_id"], name: "rel_server_actions_action_id_idx"
    t.index ["server_id", "action_id"], name: "rel_server_actions_server_id_action_id_key", unique: true
    t.index ["server_id"], name: "rel_server_actions_server_id_idx"
  end

  create_table "report_paperformat", id: :serial, comment: "Allows customization of a report.", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.boolean "default", comment: "Default paper format ?"
    t.string "format", comment: "Paper size"
    t.float "margin_top", comment: "Top Margin (mm)"
    t.float "margin_bottom", comment: "Bottom Margin (mm)"
    t.float "margin_left", comment: "Left Margin (mm)"
    t.float "margin_right", comment: "Right Margin (mm)"
    t.integer "page_height", comment: "Page height (mm)"
    t.integer "page_width", comment: "Page width (mm)"
    t.string "orientation", comment: "Orientation"
    t.boolean "header_line", comment: "Display a header line"
    t.integer "header_spacing", comment: "Header spacing"
    t.integer "dpi", null: false, comment: "Output DPI"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_bank", id: :serial, comment: "Bank", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "street", comment: "Street"
    t.string "street2", comment: "Street2"
    t.string "zip", comment: "Zip"
    t.string "city", comment: "City"
    t.integer "state", comment: "Fed. State"
    t.integer "country", comment: "Country"
    t.string "email", comment: "Email"
    t.string "phone", comment: "Phone"
    t.boolean "active", comment: "Active"
    t.string "bic", comment: "Bank Identifier Code"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["bic"], name: "res_bank_bic_index"
  end

  create_table "res_company", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "partner_id", null: false
    t.integer "currency_id", null: false
    t.integer "sequence", comment: "Sequence"
    t.integer "parent_id", comment: "Parent Company"
    t.text "report_header", comment: "Company Tagline"
    t.text "report_footer", comment: "Report Footer"
    t.binary "logo_web", comment: "Logo Web"
    t.string "account_no", comment: "Account No."
    t.string "email", comment: "Email"
    t.string "phone", comment: "Phone"
    t.string "company_registry", comment: "Company Registry"
    t.integer "paperformat_id", comment: "Paper format"
    t.string "external_report_layout", comment: "Document Template"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["name"], name: "res_company_name_uniq", unique: true
    t.index ["parent_id"], name: "res_company_parent_id_index"
  end

  create_table "res_company_users_rel", id: false, comment: "RELATION BETWEEN res_company AND res_users", force: :cascade do |t|
    t.integer "cid", null: false
    t.integer "user_id", null: false
    t.index ["cid", "user_id"], name: "res_company_users_rel_cid_user_id_key", unique: true
    t.index ["cid"], name: "res_company_users_rel_cid_idx"
    t.index ["user_id"], name: "res_company_users_rel_user_id_idx"
  end

  create_table "res_config", id: :serial, comment: "res.config", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_config_installer", id: :serial, comment: "res.config.installer", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_config_settings", id: :serial, comment: "res.config.settings", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_country", id: :serial, comment: "Country", force: :cascade do |t|
    t.string "name", null: false, comment: "Country Name"
    t.string "code", limit: 2, comment: "Country Code"
    t.text "address_format", comment: "Layout in Reports"
    t.integer "address_view_id", comment: "Input View"
    t.integer "currency_id", comment: "Currency"
    t.integer "phone_code", comment: "Country Calling Code"
    t.string "name_position", comment: "Customer Name Position"
    t.string "vat_label", comment: "Vat Label"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["code"], name: "res_country_code_uniq", unique: true
    t.index ["name"], name: "res_country_name_uniq", unique: true
  end

  create_table "res_country_group", id: :serial, comment: "Country Group", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_country_res_country_group_rel", id: false, comment: "RELATION BETWEEN res_country AND res_country_group", force: :cascade do |t|
    t.integer "res_country_id", null: false
    t.integer "res_country_group_id", null: false
    t.index ["res_country_group_id"], name: "res_country_res_country_group_rel_res_country_group_id_idx"
    t.index ["res_country_id", "res_country_group_id"], name: "res_country_res_country_group_res_country_id_res_country_gr_key", unique: true
    t.index ["res_country_id"], name: "res_country_res_country_group_rel_res_country_id_idx"
  end

  create_table "res_country_state", id: :serial, comment: "Country state", force: :cascade do |t|
    t.integer "country_id", null: false, comment: "Country"
    t.string "name", null: false, comment: "State Name"
    t.string "code", null: false, comment: "State Code"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["country_id", "code"], name: "res_country_state_name_code_uniq", unique: true
  end

  create_table "res_currency", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol", null: false
    t.decimal "rounding", comment: "Rounding Factor"
    t.boolean "active", comment: "Active"
    t.string "position", comment: "Symbol Position"
    t.string "currency_unit_label", comment: "Currency Unit"
    t.string "currency_subunit_label", comment: "Currency Subunit"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["name"], name: "res_currency_unique_name", unique: true
  end

  create_table "res_currency_rate", id: :serial, comment: "Currency Rate", force: :cascade do |t|
    t.date "name", null: false, comment: "Date"
    t.decimal "rate", comment: "Rate"
    t.integer "currency_id", comment: "Currency"
    t.integer "company_id", comment: "Company"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["name", "currency_id", "company_id"], name: "res_currency_rate_unique_name_per_day", unique: true
    t.index ["name"], name: "res_currency_rate_name_index"
  end

  create_table "res_groups", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "comment", comment: "Comment"
    t.integer "category_id", comment: "Application"
    t.integer "color", comment: "Color Index"
    t.boolean "share", comment: "Share Group"
    t.boolean "is_portal", comment: "Portal"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["category_id", "name"], name: "res_groups_name_uniq", unique: true
    t.index ["category_id"], name: "res_groups_category_id_index"
  end

  create_table "res_groups_implied_rel", id: false, comment: "RELATION BETWEEN res_groups AND res_groups", force: :cascade do |t|
    t.integer "gid", null: false
    t.integer "hid", null: false
    t.index ["gid", "hid"], name: "res_groups_implied_rel_gid_hid_key", unique: true
    t.index ["gid"], name: "res_groups_implied_rel_gid_idx"
    t.index ["hid"], name: "res_groups_implied_rel_hid_idx"
  end

  create_table "res_groups_report_rel", id: false, comment: "RELATION BETWEEN ir_act_report_xml AND res_groups", force: :cascade do |t|
    t.integer "uid", null: false
    t.integer "gid", null: false
    t.index ["gid"], name: "res_groups_report_rel_gid_idx"
    t.index ["uid", "gid"], name: "res_groups_report_rel_uid_gid_key", unique: true
    t.index ["uid"], name: "res_groups_report_rel_uid_idx"
  end

  create_table "res_groups_users_rel", id: false, comment: "RELATION BETWEEN res_groups AND res_users", force: :cascade do |t|
    t.integer "gid", null: false
    t.integer "uid", null: false
    t.index ["gid", "uid"], name: "res_groups_users_rel_gid_uid_key", unique: true
    t.index ["gid"], name: "res_groups_users_rel_gid_idx"
    t.index ["uid"], name: "res_groups_users_rel_uid_idx"
  end

  create_table "res_lang", id: :serial, comment: "Languages", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "code", null: false, comment: "Locale Code"
    t.string "iso_code", comment: "ISO code"
    t.boolean "translatable", comment: "Translatable"
    t.boolean "active", comment: "Active"
    t.string "direction", null: false, comment: "Direction"
    t.string "date_format", null: false, comment: "Date Format"
    t.string "time_format", null: false, comment: "Time Format"
    t.string "grouping", null: false, comment: "Separator Format"
    t.string "decimal_point", null: false, comment: "Decimal Separator"
    t.string "thousands_sep", comment: "Thousands Separator"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["code"], name: "res_lang_code_uniq", unique: true
    t.index ["name"], name: "res_lang_name_uniq", unique: true
  end

  create_table "res_partner", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.string "display_name", comment: "Display Name"
    t.date "date", comment: "Date"
    t.integer "title", comment: "Title"
    t.integer "parent_id", comment: "Related Company"
    t.string "ref", comment: "Internal Reference"
    t.string "lang", comment: "Language"
    t.string "tz", comment: "Timezone"
    t.integer "user_id", comment: "Salesperson"
    t.string "vat", comment: "TIN"
    t.string "website", comment: "Website"
    t.text "comment", comment: "Notes"
    t.float "credit_limit", comment: "Credit Limit"
    t.string "barcode", comment: "Barcode"
    t.boolean "active", comment: "Active"
    t.boolean "customer", comment: "Is a Customer"
    t.boolean "supplier", comment: "Is a Vendor"
    t.boolean "employee", comment: "Employee"
    t.string "function", comment: "Job Position"
    t.string "type", comment: "Address Type"
    t.string "street", comment: "Street"
    t.string "street2", comment: "Street2"
    t.string "zip", comment: "Zip"
    t.string "city", comment: "City"
    t.integer "state_id", comment: "State"
    t.integer "country_id", comment: "Country"
    t.string "email", comment: "Email"
    t.string "phone", comment: "Phone"
    t.string "mobile", comment: "Mobile"
    t.boolean "is_company", comment: "Is a Company"
    t.integer "industry_id", comment: "Industry"
    t.integer "color", comment: "Color Index"
    t.boolean "partner_share", comment: "Share Partner"
    t.integer "commercial_partner_id", comment: "Commercial Entity"
    t.integer "commercial_partner_country_id", comment: "Country"
    t.string "commercial_company_name", comment: "Company Name Entity"
    t.string "company_name", comment: "Company Name"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["commercial_partner_id"], name: "res_partner_commercial_partner_id_index"
    t.index ["company_id"], name: "res_partner_company_id_index"
    t.index ["date"], name: "res_partner_date_index"
    t.index ["display_name"], name: "res_partner_display_name_index"
    t.index ["name"], name: "res_partner_name_index"
    t.index ["parent_id"], name: "res_partner_parent_id_index"
    t.index ["ref"], name: "res_partner_ref_index"
  end

  create_table "res_partner_bank", id: :serial, comment: "Bank Accounts", force: :cascade do |t|
    t.string "acc_number", null: false, comment: "Account Number"
    t.string "sanitized_acc_number", comment: "Sanitized Account Number"
    t.integer "partner_id", comment: "Account Holder"
    t.integer "bank_id", comment: "Bank"
    t.integer "sequence", comment: "Sequence"
    t.integer "currency_id", comment: "Currency"
    t.integer "company_id", comment: "Company"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["partner_id"], name: "res_partner_bank_partner_id_index"
    t.index ["sanitized_acc_number", "company_id"], name: "res_partner_bank_unique_number", unique: true
  end

  create_table "res_partner_category", id: :serial, comment: "Partner Tags", force: :cascade do |t|
    t.integer "parent_left"
    t.integer "parent_right"
    t.string "name", null: false, comment: "Tag Name"
    t.integer "color", comment: "Color Index"
    t.integer "parent_id", comment: "Parent Category"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.index ["parent_id"], name: "res_partner_category_parent_id_index"
    t.index ["parent_left"], name: "res_partner_category_parent_left_index"
    t.index ["parent_right"], name: "res_partner_category_parent_right_index"
  end

  create_table "res_partner_industry", id: :serial, comment: "Industry", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.string "full_name", comment: "Full Name"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_partner_res_partner_category_rel", id: false, comment: "RELATION BETWEEN res_partner_category AND res_partner", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "partner_id", null: false
    t.index ["category_id", "partner_id"], name: "res_partner_res_partner_category_rel_category_id_partner_id_key", unique: true
    t.index ["category_id"], name: "res_partner_res_partner_category_rel_category_id_idx"
    t.index ["partner_id"], name: "res_partner_res_partner_category_rel_partner_id_idx"
  end

  create_table "res_partner_title", id: :serial, comment: "res.partner.title", force: :cascade do |t|
    t.string "name", null: false, comment: "Title"
    t.string "shortcut", comment: "Abbreviation"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_request_link", id: :serial, comment: "res.request.link", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "object", null: false, comment: "Object"
    t.integer "priority", comment: "Priority"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "res_users", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.string "login", null: false
    t.string "password"
    t.integer "company_id", null: false
    t.integer "partner_id", null: false
    t.text "signature", comment: "Signature"
    t.integer "action_id", comment: "Home Action"
    t.boolean "share", comment: "Share User"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
    t.string "password_crypt", comment: "Encrypted Password"
    t.index ["login"], name: "res_users_login_key", unique: true
  end

  create_table "res_users_log", id: :serial, comment: "res.users.log", force: :cascade do |t|
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "keyword"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword"], name: "index_roles_on_keyword", unique: true
  end

  create_table "rule_group_rel", id: false, comment: "RELATION BETWEEN ir_rule AND res_groups", force: :cascade do |t|
    t.integer "rule_group_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "rule_group_rel_group_id_idx"
    t.index ["rule_group_id", "group_id"], name: "rule_group_rel_rule_group_id_group_id_key", unique: true
    t.index ["rule_group_id"], name: "rule_group_rel_rule_group_id_idx"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "publication_id"
    t.bigint "user_id"
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
    t.bigint "user_id"
    t.string "creation_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_creations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "company_id"
    t.integer "works_on_id"
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.date "born_date"
    t.boolean "deleted", default: false
    t.text "facebook_data"
    t.string "facebook_access_token"
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

  create_table "web_editor_converter_test", id: :serial, comment: "web_editor.converter.test", force: :cascade do |t|
    t.string "char", comment: "Char"
    t.integer "integer", comment: "Integer"
    t.float "float", comment: "Float"
    t.decimal "numeric", comment: "Numeric"
    t.integer "many2one", comment: "Many2One"
    t.binary "binary", comment: "Binary"
    t.date "date", comment: "Date"
    t.datetime "datetime", comment: "Datetime"
    t.integer "selection", comment: "Selection"
    t.string "selection_str", comment: "Lorsqu'un pancake prend l'avion à destination de Toronto et qu'il fait une escale technique à St Claude, on dit:"
    t.text "html", comment: "Html"
    t.text "text", comment: "Text"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "web_editor_converter_test_sub", id: :serial, comment: "web_editor.converter.test.sub", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "web_planner", id: :serial, comment: "Planner", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.integer "menu_id", null: false, comment: "Menu"
    t.integer "view_id", null: false, comment: "Template"
    t.text "tooltip_planner", comment: "Planner Tooltips"
    t.string "planner_application", null: false, comment: "Planner Application"
    t.boolean "active", comment: "Active"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  create_table "web_tour_tour", id: :serial, comment: "Tours", force: :cascade do |t|
    t.string "name", null: false, comment: "Tour name"
    t.integer "user_id", comment: "Consumed by"
  end

  create_table "wizard_ir_model_menu_create", id: :serial, comment: "wizard.ir.model.menu.create", force: :cascade do |t|
    t.integer "menu_id", null: false, comment: "Parent Menu"
    t.string "name", null: false, comment: "Menu Name"
    t.integer "create_uid", comment: "Created by"
    t.datetime "create_date", comment: "Created on"
    t.integer "write_uid", comment: "Last Updated by"
    t.datetime "write_date", comment: "Last Updated on"
  end

  add_foreign_key "base_import_import", "res_users", column: "create_uid", name: "base_import_import_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_import", "res_users", column: "write_uid", name: "base_import_import_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char", "res_users", column: "create_uid", name: "base_import_tests_models_char_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char", "res_users", column: "write_uid", name: "base_import_tests_models_char_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_noreadonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_noreadonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_noreadonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_noreadonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_readonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_readonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_readonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_readonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_required", "res_users", column: "create_uid", name: "base_import_tests_models_char_required_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_required", "res_users", column: "write_uid", name: "base_import_tests_models_char_required_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_states", "res_users", column: "create_uid", name: "base_import_tests_models_char_states_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_states", "res_users", column: "write_uid", name: "base_import_tests_models_char_states_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_stillreadonly", "res_users", column: "create_uid", name: "base_import_tests_models_char_stillreadonly_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_char_stillreadonly", "res_users", column: "write_uid", name: "base_import_tests_models_char_stillreadonly_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "base_import_tests_models_m2o_related", column: "value", name: "base_import_tests_models_m2o_value_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_related", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_related_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_related", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_related_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "base_import_tests_models_m2o_required_related", column: "value", name: "base_import_tests_models_m2o_required_value_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_required_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_required_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required_related", "res_users", column: "create_uid", name: "base_import_tests_models_m2o_required_related_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_m2o_required_related", "res_users", column: "write_uid", name: "base_import_tests_models_m2o_required_related_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m", "res_users", column: "create_uid", name: "base_import_tests_models_o2m_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m", "res_users", column: "write_uid", name: "base_import_tests_models_o2m_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "base_import_tests_models_o2m", column: "parent_id", name: "base_import_tests_models_o2m_child_parent_id_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "res_users", column: "create_uid", name: "base_import_tests_models_o2m_child_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_o2m_child", "res_users", column: "write_uid", name: "base_import_tests_models_o2m_child_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_preview", "res_users", column: "create_uid", name: "base_import_tests_models_preview_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_import_tests_models_preview", "res_users", column: "write_uid", name: "base_import_tests_models_preview_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_export", "res_users", column: "create_uid", name: "base_language_export_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_export", "res_users", column: "write_uid", name: "base_language_export_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_import", "res_users", column: "create_uid", name: "base_language_import_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_import", "res_users", column: "write_uid", name: "base_language_import_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_install", "res_users", column: "create_uid", name: "base_language_install_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_language_install", "res_users", column: "write_uid", name: "base_language_install_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_uninstall", "ir_module_module", column: "module_id", name: "base_module_uninstall_module_id_fkey", on_delete: :nullify
  add_foreign_key "base_module_uninstall", "res_users", column: "create_uid", name: "base_module_uninstall_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_uninstall", "res_users", column: "write_uid", name: "base_module_uninstall_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_update", "res_users", column: "create_uid", name: "base_module_update_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_update", "res_users", column: "write_uid", name: "base_module_update_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_upgrade", "res_users", column: "create_uid", name: "base_module_upgrade_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_module_upgrade", "res_users", column: "write_uid", name: "base_module_upgrade_write_uid_fkey", on_delete: :nullify
  add_foreign_key "base_update_translations", "res_users", column: "create_uid", name: "base_update_translations_create_uid_fkey", on_delete: :nullify
  add_foreign_key "base_update_translations", "res_users", column: "write_uid", name: "base_update_translations_write_uid_fkey", on_delete: :nullify
  add_foreign_key "campaigns", "companies"
  add_foreign_key "campaigns_users", "campaigns"
  add_foreign_key "campaigns_users", "users"
  add_foreign_key "change_password_user", "change_password_wizard", column: "wizard_id", name: "change_password_user_wizard_id_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "create_uid", name: "change_password_user_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_user", "res_users", column: "user_id", name: "change_password_user_user_id_fkey", on_delete: :cascade
  add_foreign_key "change_password_user", "res_users", column: "write_uid", name: "change_password_user_write_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "create_uid", name: "change_password_wizard_create_uid_fkey", on_delete: :nullify
  add_foreign_key "change_password_wizard", "res_users", column: "write_uid", name: "change_password_wizard_write_uid_fkey", on_delete: :nullify
  add_foreign_key "channels", "companies"
  add_foreign_key "channels", "publications"
  add_foreign_key "companies_users", "companies"
  add_foreign_key "companies_users", "users"
  add_foreign_key "iap_account", "res_company", column: "company_id", name: "iap_account_company_id_fkey", on_delete: :nullify
  add_foreign_key "iap_account", "res_users", column: "create_uid", name: "iap_account_create_uid_fkey", on_delete: :nullify
  add_foreign_key "iap_account", "res_users", column: "write_uid", name: "iap_account_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "ir_model", column: "binding_model_id", name: "ir_act_client_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_client", "res_users", column: "create_uid", name: "ir_act_client_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_client", "res_users", column: "write_uid", name: "ir_act_client_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "ir_model", column: "binding_model_id", name: "ir_act_report_xml_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_report_xml", "report_paperformat", column: "paperformat_id", name: "ir_act_report_xml_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "create_uid", name: "ir_act_report_xml_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_report_xml", "res_users", column: "write_uid", name: "ir_act_report_xml_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model", column: "binding_model_id", name: "ir_act_server_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_server", "ir_model", column: "crud_model_id", name: "ir_act_server_crud_model_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "ir_model", column: "model_id", name: "ir_act_server_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_server", "ir_model_fields", column: "link_field_id", name: "ir_act_server_link_field_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "res_users", column: "create_uid", name: "ir_act_server_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_server", "res_users", column: "write_uid", name: "ir_act_server_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_url", "ir_model", column: "binding_model_id", name: "ir_act_url_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_url", "res_users", column: "create_uid", name: "ir_act_url_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_url", "res_users", column: "write_uid", name: "ir_act_url_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "ir_model", column: "binding_model_id", name: "ir_act_window_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window", "ir_ui_view", column: "search_view_id", name: "ir_act_window_search_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "ir_ui_view", column: "view_id", name: "ir_act_window_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "res_users", column: "create_uid", name: "ir_act_window_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window", "res_users", column: "write_uid", name: "ir_act_window_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_group_rel", "ir_act_window", column: "act_id", name: "ir_act_window_group_rel_act_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_group_rel", "res_groups", column: "gid", name: "ir_act_window_group_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_view", "ir_act_window", column: "act_window_id", name: "ir_act_window_view_act_window_id_fkey", on_delete: :cascade
  add_foreign_key "ir_act_window_view", "ir_ui_view", column: "view_id", name: "ir_act_window_view_view_id_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_view", "res_users", column: "create_uid", name: "ir_act_window_view_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_act_window_view", "res_users", column: "write_uid", name: "ir_act_window_view_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions", "ir_model", column: "binding_model_id", name: "ir_actions_binding_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_actions", "res_users", column: "create_uid", name: "ir_actions_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions", "res_users", column: "write_uid", name: "ir_actions_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions_todo", "res_users", column: "create_uid", name: "ir_actions_todo_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_actions_todo", "res_users", column: "write_uid", name: "ir_actions_todo_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_company", column: "company_id", name: "ir_attachment_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_users", column: "create_uid", name: "ir_attachment_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_attachment", "res_users", column: "write_uid", name: "ir_attachment_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_config_parameter", "res_users", column: "create_uid", name: "ir_config_parameter_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_config_parameter", "res_users", column: "write_uid", name: "ir_config_parameter_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_cron", "ir_act_server", column: "ir_actions_server_id", name: "ir_cron_ir_actions_server_id_fkey", on_delete: :restrict
  add_foreign_key "ir_cron", "res_users", column: "create_uid", name: "ir_cron_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_cron", "res_users", column: "user_id", name: "ir_cron_user_id_fkey", on_delete: :nullify
  add_foreign_key "ir_cron", "res_users", column: "write_uid", name: "ir_cron_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "ir_model_fields", column: "field_id", name: "ir_default_field_id_fkey", on_delete: :cascade
  add_foreign_key "ir_default", "res_company", column: "company_id", name: "ir_default_company_id_fkey", on_delete: :cascade
  add_foreign_key "ir_default", "res_users", column: "create_uid", name: "ir_default_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_default", "res_users", column: "user_id", name: "ir_default_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_default", "res_users", column: "write_uid", name: "ir_default_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports", "res_users", column: "create_uid", name: "ir_exports_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports", "res_users", column: "write_uid", name: "ir_exports_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports_line", "ir_exports", column: "export_id", name: "ir_exports_line_export_id_fkey", on_delete: :cascade
  add_foreign_key "ir_exports_line", "res_users", column: "create_uid", name: "ir_exports_line_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_exports_line", "res_users", column: "write_uid", name: "ir_exports_line_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_filters", "res_users", column: "create_uid", name: "ir_filters_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_filters", "res_users", column: "user_id", name: "ir_filters_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_filters", "res_users", column: "write_uid", name: "ir_filters_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_logging", "res_users", column: "write_uid", name: "ir_logging_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_mail_server", "res_users", column: "create_uid", name: "ir_mail_server_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_mail_server", "res_users", column: "write_uid", name: "ir_mail_server_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model", "res_users", column: "create_uid", name: "ir_model_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model", "res_users", column: "write_uid", name: "ir_model_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_access", "ir_model", column: "model_id", name: "ir_model_access_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_access", "res_groups", column: "group_id", name: "ir_model_access_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_access", "res_users", column: "create_uid", name: "ir_model_access_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_access", "res_users", column: "write_uid", name: "ir_model_access_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "ir_model", column: "model", name: "ir_model_constraint_model_fkey", on_delete: :cascade
  add_foreign_key "ir_model_constraint", "ir_module_module", column: "module", name: "ir_model_constraint_module_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "res_users", column: "create_uid", name: "ir_model_constraint_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_constraint", "res_users", column: "write_uid", name: "ir_model_constraint_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_data", "res_users", column: "create_uid", name: "ir_model_data_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_data", "res_users", column: "write_uid", name: "ir_model_data_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields", "ir_model", column: "model_id", name: "ir_model_fields_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_fields", "res_users", column: "create_uid", name: "ir_model_fields_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields", "res_users", column: "write_uid", name: "ir_model_fields_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_fields_group_rel", "ir_model_fields", column: "field_id", name: "ir_model_fields_group_rel_field_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_fields_group_rel", "res_groups", column: "group_id", name: "ir_model_fields_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "ir_model_relation", "ir_model", column: "model", name: "ir_model_relation_model_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "ir_module_module", column: "module", name: "ir_model_relation_module_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "res_users", column: "create_uid", name: "ir_model_relation_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_model_relation", "res_users", column: "write_uid", name: "ir_model_relation_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "ir_module_category", column: "parent_id", name: "ir_module_category_parent_id_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "res_users", column: "create_uid", name: "ir_module_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_category", "res_users", column: "write_uid", name: "ir_module_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "ir_module_category", column: "category_id", name: "ir_module_module_category_id_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "res_users", column: "create_uid", name: "ir_module_module_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module", "res_users", column: "write_uid", name: "ir_module_module_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_dependency", "ir_module_module", column: "module_id", name: "ir_module_module_dependency_module_id_fkey", on_delete: :cascade
  add_foreign_key "ir_module_module_dependency", "res_users", column: "create_uid", name: "ir_module_module_dependency_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_dependency", "res_users", column: "write_uid", name: "ir_module_module_dependency_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_exclusion", "ir_module_module", column: "module_id", name: "ir_module_module_exclusion_module_id_fkey", on_delete: :cascade
  add_foreign_key "ir_module_module_exclusion", "res_users", column: "create_uid", name: "ir_module_module_exclusion_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_module_module_exclusion", "res_users", column: "write_uid", name: "ir_module_module_exclusion_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "ir_model_fields", column: "fields_id", name: "ir_property_fields_id_fkey", on_delete: :cascade
  add_foreign_key "ir_property", "res_company", column: "company_id", name: "ir_property_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "res_users", column: "create_uid", name: "ir_property_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_property", "res_users", column: "write_uid", name: "ir_property_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_rule", "ir_model", column: "model_id", name: "ir_rule_model_id_fkey", on_delete: :cascade
  add_foreign_key "ir_rule", "res_users", column: "create_uid", name: "ir_rule_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_rule", "res_users", column: "write_uid", name: "ir_rule_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_company", column: "company_id", name: "ir_sequence_company_id_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_users", column: "create_uid", name: "ir_sequence_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence", "res_users", column: "write_uid", name: "ir_sequence_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence_date_range", "ir_sequence", column: "sequence_id", name: "ir_sequence_date_range_sequence_id_fkey", on_delete: :cascade
  add_foreign_key "ir_sequence_date_range", "res_users", column: "create_uid", name: "ir_sequence_date_range_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_sequence_date_range", "res_users", column: "write_uid", name: "ir_sequence_date_range_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "ir_act_server", column: "server_id", name: "ir_server_object_lines_server_id_fkey", on_delete: :cascade
  add_foreign_key "ir_server_object_lines", "ir_model_fields", column: "col1", name: "ir_server_object_lines_col1_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "res_users", column: "create_uid", name: "ir_server_object_lines_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_server_object_lines", "res_users", column: "write_uid", name: "ir_server_object_lines_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_translation", "res_lang", column: "lang", primary_key: "code", name: "ir_translation_lang_fkey_res_lang"
  add_foreign_key "ir_ui_menu", "ir_ui_menu", column: "parent_id", name: "ir_ui_menu_parent_id_fkey", on_delete: :restrict
  add_foreign_key "ir_ui_menu", "res_users", column: "create_uid", name: "ir_ui_menu_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_menu", "res_users", column: "write_uid", name: "ir_ui_menu_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_menu_group_rel", "ir_ui_menu", column: "menu_id", name: "ir_ui_menu_group_rel_menu_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_menu_group_rel", "res_groups", column: "gid", name: "ir_ui_menu_group_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view", "ir_ui_view", column: "inherit_id", name: "ir_ui_view_inherit_id_fkey", on_delete: :restrict
  add_foreign_key "ir_ui_view", "res_users", column: "create_uid", name: "ir_ui_view_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view", "res_users", column: "write_uid", name: "ir_ui_view_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_custom", "ir_ui_view", column: "ref_id", name: "ir_ui_view_custom_ref_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_custom", "res_users", column: "create_uid", name: "ir_ui_view_custom_create_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_custom", "res_users", column: "user_id", name: "ir_ui_view_custom_user_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_custom", "res_users", column: "write_uid", name: "ir_ui_view_custom_write_uid_fkey", on_delete: :nullify
  add_foreign_key "ir_ui_view_group_rel", "ir_ui_view", column: "view_id", name: "ir_ui_view_group_rel_view_id_fkey", on_delete: :cascade
  add_foreign_key "ir_ui_view_group_rel", "res_groups", column: "group_id", name: "ir_ui_view_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "users"
  add_foreign_key "node_users", "nodes"
  add_foreign_key "node_users", "roles"
  add_foreign_key "node_users", "users"
  add_foreign_key "nodes", "campaigns"
  add_foreign_key "nodes", "nodes"
  add_foreign_key "notifications", "tasks"
  add_foreign_key "publication_logs", "publications"
  add_foreign_key "publication_logs", "users"
  add_foreign_key "publication_messages", "publications"
  add_foreign_key "publication_messages", "users"
  add_foreign_key "publications", "nodes"
  add_foreign_key "publications", "publication_statuses"
  add_foreign_key "rel_modules_langexport", "base_language_export", column: "wiz_id", name: "rel_modules_langexport_wiz_id_fkey", on_delete: :cascade
  add_foreign_key "rel_modules_langexport", "ir_module_module", column: "module_id", name: "rel_modules_langexport_module_id_fkey", on_delete: :cascade
  add_foreign_key "rel_server_actions", "ir_act_server", column: "action_id", name: "rel_server_actions_action_id_fkey", on_delete: :cascade
  add_foreign_key "rel_server_actions", "ir_act_server", column: "server_id", name: "rel_server_actions_server_id_fkey", on_delete: :cascade
  add_foreign_key "report_paperformat", "res_users", column: "create_uid", name: "report_paperformat_create_uid_fkey", on_delete: :nullify
  add_foreign_key "report_paperformat", "res_users", column: "write_uid", name: "report_paperformat_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_country", column: "country", name: "res_bank_country_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_country_state", column: "state", name: "res_bank_state_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_users", column: "create_uid", name: "res_bank_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_bank", "res_users", column: "write_uid", name: "res_bank_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "report_paperformat", column: "paperformat_id", name: "res_company_paperformat_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_company", column: "parent_id", name: "res_company_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_currency", column: "currency_id", name: "res_company_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_partner", column: "partner_id", name: "res_company_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "create_uid", name: "res_company_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company", "res_users", column: "write_uid", name: "res_company_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_company_users_rel", "res_company", column: "cid", name: "res_company_users_rel_cid_fkey", on_delete: :cascade
  add_foreign_key "res_company_users_rel", "res_users", column: "user_id", name: "res_company_users_rel_user_id_fkey", on_delete: :cascade
  add_foreign_key "res_config", "res_users", column: "create_uid", name: "res_config_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config", "res_users", column: "write_uid", name: "res_config_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_installer", "res_users", column: "create_uid", name: "res_config_installer_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_installer", "res_users", column: "write_uid", name: "res_config_installer_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_settings", "res_users", column: "create_uid", name: "res_config_settings_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_config_settings", "res_users", column: "write_uid", name: "res_config_settings_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country", "ir_ui_view", column: "address_view_id", name: "res_country_address_view_id_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_currency", column: "currency_id", name: "res_country_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_users", column: "create_uid", name: "res_country_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country", "res_users", column: "write_uid", name: "res_country_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_group", "res_users", column: "create_uid", name: "res_country_group_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_group", "res_users", column: "write_uid", name: "res_country_group_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_res_country_group_rel", "res_country", name: "res_country_res_country_group_rel_res_country_id_fkey", on_delete: :cascade
  add_foreign_key "res_country_res_country_group_rel", "res_country_group", name: "res_country_res_country_group_rel_res_country_group_id_fkey", on_delete: :cascade
  add_foreign_key "res_country_state", "res_country", column: "country_id", name: "res_country_state_country_id_fkey", on_delete: :nullify
  add_foreign_key "res_country_state", "res_users", column: "create_uid", name: "res_country_state_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_country_state", "res_users", column: "write_uid", name: "res_country_state_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency", "res_users", column: "create_uid", name: "res_currency_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency", "res_users", column: "write_uid", name: "res_currency_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_company", column: "company_id", name: "res_currency_rate_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_currency", column: "currency_id", name: "res_currency_rate_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_users", column: "create_uid", name: "res_currency_rate_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_currency_rate", "res_users", column: "write_uid", name: "res_currency_rate_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "ir_module_category", column: "category_id", name: "res_groups_category_id_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "res_users", column: "create_uid", name: "res_groups_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups", "res_users", column: "write_uid", name: "res_groups_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_groups_implied_rel", "res_groups", column: "gid", name: "res_groups_implied_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_implied_rel", "res_groups", column: "hid", name: "res_groups_implied_rel_hid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_report_rel", "ir_act_report_xml", column: "uid", name: "res_groups_report_rel_uid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_report_rel", "res_groups", column: "gid", name: "res_groups_report_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_users_rel", "res_groups", column: "gid", name: "res_groups_users_rel_gid_fkey", on_delete: :cascade
  add_foreign_key "res_groups_users_rel", "res_users", column: "uid", name: "res_groups_users_rel_uid_fkey", on_delete: :cascade
  add_foreign_key "res_lang", "res_users", column: "create_uid", name: "res_lang_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_lang", "res_users", column: "write_uid", name: "res_lang_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_company", column: "company_id", name: "res_partner_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_country", column: "commercial_partner_country_id", name: "res_partner_commercial_partner_country_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_country", column: "country_id", name: "res_partner_country_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_country_state", column: "state_id", name: "res_partner_state_id_fkey", on_delete: :restrict
  add_foreign_key "res_partner", "res_partner", column: "commercial_partner_id", name: "res_partner_commercial_partner_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner", column: "parent_id", name: "res_partner_parent_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner_industry", column: "industry_id", name: "res_partner_industry_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_partner_title", column: "title", name: "res_partner_title_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "create_uid", name: "res_partner_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "user_id", name: "res_partner_user_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner", "res_users", column: "write_uid", name: "res_partner_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_bank", column: "bank_id", name: "res_partner_bank_bank_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_company", column: "company_id", name: "res_partner_bank_company_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_bank", "res_currency", column: "currency_id", name: "res_partner_bank_currency_id_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_partner", column: "partner_id", name: "res_partner_bank_partner_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_bank", "res_users", column: "create_uid", name: "res_partner_bank_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_bank", "res_users", column: "write_uid", name: "res_partner_bank_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_category", "res_partner_category", column: "parent_id", name: "res_partner_category_parent_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_category", "res_users", column: "create_uid", name: "res_partner_category_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_category", "res_users", column: "write_uid", name: "res_partner_category_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_industry", "res_users", column: "create_uid", name: "res_partner_industry_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_industry", "res_users", column: "write_uid", name: "res_partner_industry_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_res_partner_category_rel", "res_partner", column: "partner_id", name: "res_partner_res_partner_category_rel_partner_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_res_partner_category_rel", "res_partner_category", column: "category_id", name: "res_partner_res_partner_category_rel_category_id_fkey", on_delete: :cascade
  add_foreign_key "res_partner_title", "res_users", column: "create_uid", name: "res_partner_title_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_partner_title", "res_users", column: "write_uid", name: "res_partner_title_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_request_link", "res_users", column: "create_uid", name: "res_request_link_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_request_link", "res_users", column: "write_uid", name: "res_request_link_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_company", column: "company_id", name: "res_users_company_id_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_partner", column: "partner_id", name: "res_users_partner_id_fkey", on_delete: :restrict
  add_foreign_key "res_users", "res_users", column: "create_uid", name: "res_users_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users", "res_users", column: "write_uid", name: "res_users_write_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users_log", "res_users", column: "create_uid", name: "res_users_log_create_uid_fkey", on_delete: :nullify
  add_foreign_key "res_users_log", "res_users", column: "write_uid", name: "res_users_log_write_uid_fkey", on_delete: :nullify
  add_foreign_key "rule_group_rel", "ir_rule", column: "rule_group_id", name: "rule_group_rel_rule_group_id_fkey", on_delete: :cascade
  add_foreign_key "rule_group_rel", "res_groups", column: "group_id", name: "rule_group_rel_group_id_fkey", on_delete: :cascade
  add_foreign_key "tasks", "publications"
  add_foreign_key "tasks", "users"
  add_foreign_key "web_editor_converter_test", "res_users", column: "create_uid", name: "web_editor_converter_test_create_uid_fkey", on_delete: :nullify
  add_foreign_key "web_editor_converter_test", "res_users", column: "write_uid", name: "web_editor_converter_test_write_uid_fkey", on_delete: :nullify
  add_foreign_key "web_editor_converter_test", "web_editor_converter_test_sub", column: "many2one", name: "web_editor_converter_test_many2one_fkey", on_delete: :nullify
  add_foreign_key "web_editor_converter_test_sub", "res_users", column: "create_uid", name: "web_editor_converter_test_sub_create_uid_fkey", on_delete: :nullify
  add_foreign_key "web_editor_converter_test_sub", "res_users", column: "write_uid", name: "web_editor_converter_test_sub_write_uid_fkey", on_delete: :nullify
  add_foreign_key "web_planner", "ir_ui_menu", column: "menu_id", name: "web_planner_menu_id_fkey", on_delete: :nullify
  add_foreign_key "web_planner", "ir_ui_view", column: "view_id", name: "web_planner_view_id_fkey", on_delete: :nullify
  add_foreign_key "web_planner", "res_users", column: "create_uid", name: "web_planner_create_uid_fkey", on_delete: :nullify
  add_foreign_key "web_planner", "res_users", column: "write_uid", name: "web_planner_write_uid_fkey", on_delete: :nullify
  add_foreign_key "web_tour_tour", "res_users", column: "user_id", name: "web_tour_tour_user_id_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "ir_ui_menu", column: "menu_id", name: "wizard_ir_model_menu_create_menu_id_fkey", on_delete: :cascade
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "create_uid", name: "wizard_ir_model_menu_create_create_uid_fkey", on_delete: :nullify
  add_foreign_key "wizard_ir_model_menu_create", "res_users", column: "write_uid", name: "wizard_ir_model_menu_create_write_uid_fkey", on_delete: :nullify
end
