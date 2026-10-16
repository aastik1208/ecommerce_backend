# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_28_171110) do

  create_table "active_storage_attachments", charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "latin1", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "latin1", force: :cascade do |t|
    t.string "fullname"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "country"
    t.string "mobile_number"
    t.bigint "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "permanent", default: false
    t.boolean "defaultShipping", default: true
    t.boolean "defaultBilling", default: true
    t.string "region"
    t.string "country_id"
    t.string "postcode"
    t.string "firstname"
    t.string "lastname"
  end

  create_table "admin_analytics_usage_version_log", id: { type: :integer, comment: "Log ID", unsigned: true }, charset: "utf8", comment: "Admin Notification Viewer Log Table", force: :cascade do |t|
    t.string "last_viewed_in_version", limit: 50, null: false, comment: "Viewer last viewed on product version"
    t.index ["last_viewed_in_version"], name: "ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION", unique: true
  end

  create_table "admin_passwords", primary_key: "password_id", id: { type: :integer, comment: "Password ID", unsigned: true }, charset: "utf8", comment: "Admin Passwords", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, comment: "User ID", unsigned: true
    t.string "password_hash", limit: 100, comment: "Password Hash"
    t.integer "expires", default: 0, null: false, comment: "Deprecated", unsigned: true
    t.integer "last_updated", default: 0, null: false, comment: "Last Updated", unsigned: true
    t.index ["user_id"], name: "ADMIN_PASSWORDS_USER_ID"
  end

  create_table "admin_profile", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Admin Profile Picture", force: :cascade do |t|
    t.string "admin_id", comment: "admin_id"
    t.string "admin_name", comment: "admin_name"
    t.string "profile_image", comment: "profile_image"
  end

  create_table "admin_system_messages", primary_key: "identity", id: { type: :string, limit: 100, comment: "Message ID" }, charset: "utf8", comment: "Admin System Messages", force: :cascade do |t|
    t.integer "severity", limit: 2, default: 0, null: false, comment: "Problem type", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Create date"
  end

  create_table "admin_user", primary_key: "user_id", id: { type: :integer, comment: "User ID", unsigned: true }, charset: "utf8", comment: "Admin User Table", force: :cascade do |t|
    t.string "firstname", limit: 32, comment: "User First Name"
    t.string "lastname", limit: 32, comment: "User Last Name"
    t.string "email", limit: 128, comment: "User Email"
    t.string "username", limit: 40, comment: "User Login"
    t.string "password", null: false, comment: "User Password"
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "User Created Time"
    t.timestamp "modified", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "User Modified Time"
    t.timestamp "logdate", comment: "User Last Login Time"
    t.integer "lognum", limit: 2, default: 0, null: false, comment: "User Login Number", unsigned: true
    t.integer "reload_acl_flag", limit: 2, default: 0, null: false, comment: "Reload ACL"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "User Is Active"
    t.text "extra", comment: "User Extra Data"
    t.text "rp_token", comment: "Reset Password Link Token"
    t.timestamp "rp_token_created_at", comment: "Reset Password Link Token Creation Date"
    t.string "interface_locale", limit: 16, default: "en_US", null: false, comment: "Backend interface locale"
    t.integer "failures_num", limit: 2, default: 0, comment: "Failure Number"
    t.timestamp "first_failure", comment: "First Failure"
    t.timestamp "lock_expires", comment: "Expiration Lock Dates"
    t.text "refresh_token", comment: "Email connector refresh token"
    t.index ["username"], name: "ADMIN_USER_USERNAME", unique: true
  end

  create_table "admin_user_expiration", primary_key: "user_id", id: { type: :integer, comment: "User ID", unsigned: true, default: nil }, charset: "utf8", comment: "Admin User expiration dates table", force: :cascade do |t|
    t.timestamp "expires_at", null: false, comment: "User Expiration Date"
  end

  create_table "admin_user_session", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Admin User sessions table", force: :cascade do |t|
    t.string "session_id", limit: 128, null: false, comment: "Session ID value"
    t.integer "user_id", comment: "Admin User ID", unsigned: true
    t.integer "status", limit: 2, default: 1, null: false, comment: "Current Session status", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created Time"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Update Time"
    t.string "ip", limit: 15, null: false, comment: "Remote user IP"
    t.index ["session_id"], name: "ADMIN_USER_SESSION_SESSION_ID"
    t.index ["user_id"], name: "ADMIN_USER_SESSION_USER_ID"
  end

  create_table "adminnotification_inbox", primary_key: "notification_id", id: { type: :integer, comment: "Notification ID", unsigned: true }, charset: "utf8", comment: "Adminnotification Inbox", force: :cascade do |t|
    t.integer "severity", limit: 2, default: 0, null: false, comment: "Problem type", unsigned: true
    t.timestamp "date_added", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Create date"
    t.string "title", null: false, comment: "Title"
    t.text "description", comment: "Description"
    t.string "url", comment: "Url"
    t.integer "is_read", limit: 2, default: 0, null: false, comment: "Flag if notification read", unsigned: true
    t.integer "is_remove", limit: 2, default: 0, null: false, comment: "Flag if notification might be removed", unsigned: true
    t.integer "is_amasty", limit: 2, default: 0, null: false, comment: "Is Amasty Notification"
    t.datetime "expiration_date", comment: "Expiration Date"
    t.text "image_url", comment: "Image Url"
    t.index ["is_read"], name: "ADMINNOTIFICATION_INBOX_IS_READ"
    t.index ["is_remove"], name: "ADMINNOTIFICATION_INBOX_IS_REMOVE"
    t.index ["severity"], name: "ADMINNOTIFICATION_INBOX_SEVERITY"
  end

  create_table "adobe_stock_asset", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Adobe Stock Asset", force: :cascade do |t|
    t.integer "media_gallery_id", comment: "Media gallery ID", unsigned: true
    t.integer "category_id", comment: "Category ID", unsigned: true
    t.integer "creator_id", comment: "Creator ID", unsigned: true
    t.integer "is_licensed", default: 0, null: false, comment: "Is Licensed", unsigned: true
    t.string "creation_date", comment: "Creation Date"
    t.index ["category_id"], name: "ADOBE_STOCK_ASSET_CATEGORY_ID"
    t.index ["creator_id"], name: "ADOBE_STOCK_ASSET_CREATOR_ID"
    t.index ["id"], name: "ADOBE_STOCK_ASSET_ID"
    t.index ["media_gallery_id"], name: "ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID"
  end

  create_table "adobe_stock_category", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Adobe Stock Category", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.index ["id"], name: "ADOBE_STOCK_CATEGORY_ID"
  end

  create_table "adobe_stock_creator", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Adobe Stock Creator", force: :cascade do |t|
    t.string "name", comment: "Asset creator's name"
    t.index ["id"], name: "ADOBE_STOCK_CREATOR_ID"
  end

  create_table "adobe_user_profile", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Adobe IMS User Profile", force: :cascade do |t|
    t.integer "admin_user_id", default: 0, null: false, comment: "Admin User Id", unsigned: true
    t.string "name", null: false, comment: "Display Name"
    t.string "email", null: false, comment: "user profile email"
    t.string "image", null: false, comment: "user profile avatar"
    t.string "account_type", comment: "Account Type"
    t.text "access_token", comment: "Access Token"
    t.text "refresh_token", comment: "Refresh Token"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.timestamp "access_token_expires_at", null: false, comment: "Access Token Expires At"
    t.index ["admin_user_id"], name: "ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID"
    t.index ["id"], name: "ADOBE_USER_PROFILE_ID"
  end

  create_table "amasty_amcheckout_additional", id: { type: :integer, comment: "Id", unsigned: true }, charset: "utf8", comment: "amasty_amcheckout_additional", force: :cascade do |t|
    t.integer "quote_id", null: false, comment: "Quote Id", unsigned: true
    t.text "comment", comment: "Order Comment"
    t.boolean "is_subscribe", default: false, null: false, comment: "Subscribe Customer"
    t.boolean "is_register", default: false, null: false, comment: "Register Customer"
    t.string "register_dob", comment: "Date of Birth"
    t.index ["quote_id"], name: "AMASTY_AMCHECKOUT_ADDITIONAL_QUOTE_ID", unique: true
  end

  create_table "amasty_amcheckout_additional_fee", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Checkout Additional Fee Table", force: :cascade do |t|
    t.integer "order_id", comment: "Order Id", unsigned: true
    t.integer "quote_id", comment: "Quote Id", unsigned: true
    t.float "amount", null: false, comment: "Amount"
    t.float "base_amount", null: false, comment: "Base Amount"
    t.index ["order_id"], name: "AMASTY_AMCHECKOUT_ADDITIONAL_FEE_ORDER_ID_SALES_ORDER_ENTITY_ID"
    t.index ["quote_id"], name: "AMASTY_AMCHECKOUT_ADDITIONAL_FEE_QUOTE_ID_QUOTE_ENTITY_ID"
  end

  create_table "amasty_amcheckout_delivery", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Checkout Delivery Table", force: :cascade do |t|
    t.integer "order_id", comment: "Order Id", unsigned: true
    t.integer "quote_id", comment: "Quote Id", unsigned: true
    t.date "date", comment: "Delivery Date"
    t.integer "time", limit: 2, comment: "Delivery Time"
    t.text "comment", comment: "Delivery Comment"
    t.index ["order_id"], name: "AMASTY_AMCHECKOUT_DELIVERY_ORDER_ID_SALES_ORDER_ENTITY_ID"
    t.index ["quote_id"], name: "AMASTY_AMCHECKOUT_DELIVERY_QUOTE_ID_QUOTE_ENTITY_ID"
  end

  create_table "amasty_amcheckout_field", id: { type: :integer, limit: 2, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Checkout Field Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, null: false, comment: "EAV Attribute ID", unsigned: true
    t.string "label", null: false, comment: "Label"
    t.integer "sort_order", limit: 2, null: false, comment: "Sort Order"
    t.boolean "required", null: false, comment: "Is Required"
    t.integer "width", limit: 2, null: false, comment: "Width"
    t.boolean "enabled", null: false, comment: "Enabled"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id"
    t.index ["attribute_id"], name: "AMASTY_AMCHECKOUT_FIELD_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID"
  end

  create_table "amasty_amcheckout_order_custom_fields", primary_key: "entity_id", id: { type: :integer, comment: "Custom Field Id", unsigned: true }, charset: "utf8", comment: "Order Custom Checkout Fields Values", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.string "billing_value", comment: "Billing Value"
    t.string "shipping_value", comment: "Shipping Value"
    t.integer "order_id", null: false, comment: "Order Id", unsigned: true
    t.index ["order_id"], name: "AMASTY_AMCHKT_ORDER_CUSTOM_FIELDS_ORDER_ID_SALES_ORDER_ENTT_ID"
  end

  create_table "amasty_amcheckout_quote_custom_fields", primary_key: "entity_id", id: { type: :integer, comment: "Custom Field Id", unsigned: true }, charset: "utf8", comment: "Quote Custom Checkout Fields Values", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.string "billing_value", comment: "Billing Value"
    t.string "shipping_value", comment: "Shipping Value"
    t.integer "quote_id", null: false, comment: "Quote Id", unsigned: true
    t.index ["quote_id"], name: "AMASTY_AMCHECKOUT_QUOTE_CUSTOM_FIELDS_QUOTE_ID_QUOTE_ENTITY_ID"
  end

  create_table "amasty_amcheckout_quote_passwords", primary_key: ["entity_id", "quote_id"], charset: "utf8", comment: "Storage for customer quote passwords (needed to create account while place order)", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity Id", unsigned: true, auto_increment: true
    t.integer "quote_id", null: false, comment: "Quote Id", unsigned: true
    t.string "password_hash", limit: 128, comment: "Password Hash"
    t.index ["quote_id"], name: "AMASTY_AMCHECKOUT_QUOTE_PASSWORDS_QUOTE_ID_QUOTE_ENTITY_ID"
  end

  create_table "amasty_amshopby_cms_page", primary_key: "entity_id", id: { type: :integer, limit: 2, comment: "Entity_id" }, charset: "utf8", comment: "amasty_amshopby_cms_page", force: :cascade do |t|
    t.integer "page_id", limit: 2, null: false, comment: "Page_id"
    t.boolean "enabled", null: false, comment: "Enabled"
    t.index ["page_id"], name: "AMASTY_AMSHOPBY_CMS_PAGE_PAGE_ID_CMS_PAGE_PAGE_ID"
  end

  create_table "amasty_amshopby_filter_setting", primary_key: "setting_id", id: { type: :integer, limit: 2, comment: "Setting_id" }, charset: "utf8", comment: "amasty_amshopby_filter_setting", force: :cascade do |t|
    t.string "filter_code", limit: 100, null: false, comment: "Filter_code"
    t.integer "is_multiselect", limit: 2, default: 0, null: false, comment: "Is_multiselect"
    t.integer "display_mode", limit: 2, default: 0, null: false, comment: "Display_mode"
    t.integer "is_seo_significant", limit: 2, default: 0, null: false, comment: "Is_seo_significant"
    t.decimal "slider_step", precision: 12, scale: 4, default: "1.0", null: false, comment: "Slider Step"
    t.boolean "units_label_use_currency_symbol", default: true, null: false, comment: "is Units label used currency symbol"
    t.string "units_label", default: "", null: false, comment: "Units label"
    t.integer "index_mode", default: 0, null: false, comment: "Robots Index Mode"
    t.integer "follow_mode", default: 0, null: false, comment: "Robots Follow Mode"
    t.integer "is_expanded", limit: 2, default: 0, null: false, comment: "Is filter expanded"
    t.integer "sort_options_by", limit: 2, default: 0, null: false, comment: "Sort Options By"
    t.integer "show_product_quantities", limit: 2, default: 0, null: false, comment: "Show Product Quantities"
    t.integer "is_show_search_box", limit: 2, default: 0, null: false, comment: "Show Search Box"
    t.integer "number_unfolded_options", limit: 2, default: 0, null: false, comment: "Number of unfolded options"
    t.text "tooltip", null: false, comment: "Tooltip"
    t.integer "is_use_and_logic", limit: 2, default: 0, null: false, comment: "Is Use And Logic"
    t.boolean "add_from_to_widget", null: false, comment: "Add From To Widget"
    t.string "visible_in_categories", default: "visible_everywhere", null: false, comment: "Visible In Categories"
    t.text "categories_filter", null: false, comment: "Categories Filter"
    t.text "attributes_filter", null: false, comment: "Attributes Filter"
    t.text "attributes_options_filter", null: false, comment: "Attributes Options Filter"
    t.integer "block_position", limit: 2, default: 0, null: false, comment: "Show in the Block"
    t.decimal "slider_min", precision: 12, scale: 4, comment: "Slider Min Value"
    t.decimal "slider_max", precision: 12, scale: 4, comment: "Slider Max Value"
    t.integer "rel_nofollow", limit: 2, default: 1, null: false, comment: "Add rel=\"nofollow\""
    t.boolean "show_icons_on_product", default: false, null: false, comment: "Show options images block on product view page"
    t.integer "category_tree_display_mode", limit: 2, default: 0, null: false, comment: "Category Tree Display Mode"
    t.integer "position_label", limit: 2, default: 0, null: false, comment: "Position label"
    t.bigint "limit_options_show_search_box", default: 0, null: false, comment: "Show Search Box When Number Options"
    t.index ["filter_code"], name: "AMASTY_AMSHOPBY_FILTER_SETTING_FILTER_CODE", unique: true
  end

  create_table "amasty_amshopby_group_attr", primary_key: "group_id", id: { type: :integer, limit: 2, comment: "Group_id" }, charset: "utf8", comment: "amasty_amshopby_group_attr", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute_id", unsigned: true
    t.string "name", null: false, comment: "Name"
    t.string "group_code", limit: 50, null: false, comment: "Group_code"
    t.string "url", comment: "Url"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position"
    t.string "visual", comment: "Visual"
    t.integer "type", limit: 2, default: 0, null: false, comment: "Type"
    t.boolean "enabled", null: false, comment: "Enabled"
    t.index ["attribute_id", "group_code"], name: "AMASTY_AMSHOPBY_GROUP_ATTR_ATTRIBUTE_ID_GROUP_CODE", unique: true
  end

  create_table "amasty_amshopby_group_attr_option", primary_key: "group_option_id", id: { type: :integer, limit: 2, comment: "Group_option_id" }, charset: "utf8", comment: "amasty_amshopby_group_attr_option", force: :cascade do |t|
    t.integer "group_id", limit: 2, null: false, comment: "Group_id"
    t.integer "option_id", null: false, comment: "Option ID", unsigned: true
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["group_id", "option_id"], name: "AMASTY_AMSHOPBY_GROUP_ATTR_OPTION_GROUP_ID_OPTION_ID", unique: true
    t.index ["option_id"], name: "AMASTY_AMSHOPBY_GROUP_ATTR_OPT_OPT_ID_EAV_ATTR_OPT_OPT_ID"
  end

  create_table "amasty_amshopby_group_attr_value", primary_key: "group_option_id", id: { type: :integer, limit: 2, comment: "Group_option_id" }, charset: "utf8", comment: "amasty_amshopby_group_attr_value", force: :cascade do |t|
    t.integer "group_id", limit: 2, null: false, comment: "Group_id"
    t.string "value", limit: 20, default: "", null: false, comment: "Option Value"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["group_id"], name: "FK_48904B8AA7D37656849240EB1C2061BB"
  end

  create_table "amasty_amshopby_option_setting", primary_key: "option_setting_id", id: { type: :integer, limit: 2, comment: "Option_setting_id" }, charset: "utf8", comment: "amasty_amshopby_option_setting", force: :cascade do |t|
    t.string "filter_code", null: false, comment: "Filter_code"
    t.integer "value", null: false, comment: "Value"
    t.integer "store_id", default: 0, null: false, comment: "Store_id"
    t.string "url_alias", null: false, comment: "Url_alias"
    t.integer "is_featured", limit: 2, default: 0, null: false, comment: "Is_featured"
    t.text "meta_title", null: false, comment: "Meta_title"
    t.text "meta_description", comment: "Meta_description"
    t.text "meta_keywords", comment: "Meta_keywords"
    t.text "title", null: false, comment: "Title"
    t.text "description", comment: "Description"
    t.string "image", comment: "Image"
    t.integer "top_cms_block_id", comment: "Top_cms_block_id"
    t.integer "bottom_cms_block_id", comment: "Bottom_cms_block_id"
    t.integer "slider_position", default: 0, null: false, comment: "Slider Position"
    t.string "slider_image", comment: "Slider Image"
    t.text "short_description", null: false, comment: "Short description for product page or tooltip"
    t.string "small_image_alt", default: "", null: false, comment: "Image alt"
    t.integer "is_show_in_slider", limit: 2, default: 0, null: false, comment: "Is show in slider"
  end

  create_table "amasty_amshopby_page", primary_key: "page_id", id: { type: :integer, limit: 2, comment: "Page ID" }, charset: "utf8", comment: "Amasty ShopBy Page Table", force: :cascade do |t|
    t.string "position", default: "replace", null: false, comment: "Position"
    t.string "url", comment: "Url"
    t.string "title", comment: "Title"
    t.text "description", comment: "description"
    t.string "meta_title", comment: "Meta Title"
    t.text "meta_keywords", comment: "Page Meta Keywords"
    t.text "meta_description", comment: "Page Meta Description"
    t.text "conditions", size: :medium, comment: "Conditions"
    t.string "categories", comment: "Categories"
    t.integer "top_block_id", limit: 2, comment: "Top Block ID"
    t.integer "bottom_block_id", limit: 2, comment: "Bottom Block ID"
    t.string "image", comment: "Image"
    t.index ["bottom_block_id"], name: "AMASTY_AMSHOPBY_PAGE_BOTTOM_BLOCK_ID_CMS_BLOCK_BLOCK_ID"
    t.index ["title", "description", "meta_title", "meta_keywords", "meta_description"], name: "FTI_6ADE8277DA39119B128E0FB0E2C213CD", type: :fulltext
    t.index ["top_block_id"], name: "AMASTY_AMSHOPBY_PAGE_TOP_BLOCK_ID_CMS_BLOCK_BLOCK_ID"
  end

  create_table "amasty_amshopby_page_store", primary_key: ["page_id", "store_id"], charset: "utf8", comment: "Amasty ShopBy Page To Store Linkage Table", force: :cascade do |t|
    t.integer "page_id", limit: 2, null: false, comment: "Page ID"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "AMASTY_AMSHOPBY_PAGE_STORE_STORE_ID"
  end

  create_table "amasty_export_process", id: { type: :integer, comment: "Id", unsigned: true }, charset: "utf8", comment: "amasty_export_process", force: :cascade do |t|
    t.string "entity_code", limit: 127, null: false, comment: "Entity_code"
    t.binary "profile_config", size: :long, null: false, comment: "Profile_config"
    t.string "identity", limit: 127, null: false, comment: "Identity"
    t.integer "pid", comment: "Pid"
    t.string "status", limit: 127, null: false, comment: "Status"
    t.boolean "finished", null: false, comment: "Finished"
    t.binary "export_result", comment: "Export_result"
    t.index ["identity"], name: "AMASTY_EXPORT_PROCESS_IDENTITY", unique: true
  end

  create_table "amasty_geoip_block", primary_key: "block_id", id: { type: :integer, comment: "Block Id", unsigned: true }, charset: "utf8", comment: "Amasty Geoip Block Table", force: :cascade do |t|
    t.integer "start_ip_num", null: false, comment: "Start Ip Num", unsigned: true
    t.integer "end_ip_num", null: false, comment: "End Ip Num", unsigned: true
    t.integer "geoip_loc_id", null: false, comment: "Geoip Loc Id", unsigned: true
    t.text "postal_code", comment: "Postal Code"
    t.float "latitude", comment: "Latitude"
    t.float "longitude", comment: "Longitude"
    t.index ["geoip_loc_id"], name: "AMASTY_GEOIP_BLOCK_GEOIP_LOC_ID"
    t.index ["start_ip_num", "end_ip_num"], name: "AMASTY_GEOIP_BLOCK_START_IP_NUM_END_IP_NUM"
  end

  create_table "amasty_geoip_block_v6", primary_key: "block_id", id: { type: :integer, comment: "Block Id", unsigned: true }, charset: "utf8", comment: "Amasty Geoip Block Table IpV6", force: :cascade do |t|
    t.string "start_ip_num", limit: 40, null: false, comment: "Start Ip Num"
    t.string "end_ip_num", limit: 40, null: false, comment: "End Ip Num"
    t.integer "geoip_loc_id", null: false, comment: "Geoip Loc Id", unsigned: true
    t.text "postal_code", comment: "Postal Code"
    t.float "latitude", comment: "Latitude"
    t.float "longitude", comment: "Longitude"
  end

  create_table "amasty_geoip_location", primary_key: "location_id", id: { type: :integer, comment: "Location Id", unsigned: true }, charset: "utf8", comment: "Amasty Geoip Location Table", force: :cascade do |t|
    t.integer "geoip_loc_id", null: false, comment: "Geoip Loc Id", unsigned: true
    t.text "country", comment: "Country"
    t.text "city", comment: "City"
    t.text "region", comment: "Region"
    t.index ["geoip_loc_id"], name: "AMASTY_GEOIP_LOCATION_GEOIP_LOC_ID"
  end

  create_table "amasty_rma_guest_create_request", primary_key: "create_id", id: { type: :integer, comment: "Create_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Guest Create Request Table", force: :cascade do |t|
    t.string "secret_code", limit: 32, null: false, comment: "Secret_code"
    t.integer "order_id", null: false, comment: "Order_id", unsigned: true
  end

  create_table "amasty_rma_history", primary_key: "event_id", id: { type: :integer, comment: "Event_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA History Table", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "Request_id", unsigned: true
    t.timestamp "event_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Event_date"
    t.integer "event_type", limit: 2, default: 0, null: false, comment: "Event_type"
    t.text "event_data", null: false, comment: "Event_data"
    t.integer "event_initiator", limit: 2, default: 0, null: false, comment: "Event_initiator", unsigned: true
    t.string "event_initiator_name", default: "", null: false, comment: "Event_initiator_name"
  end

  create_table "amasty_rma_item_condition", primary_key: "condition_id", id: { type: :integer, comment: "Condition_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Item Conditions Table", force: :cascade do |t|
    t.string "title", default: "", null: false, comment: "Title"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position"
    t.boolean "is_deleted", null: false, comment: "Is_deleted"
  end

  create_table "amasty_rma_item_condition_store", primary_key: "condition_store_id", id: { type: :integer, comment: "Condition_store_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Item Condition Stores Table", force: :cascade do |t|
    t.integer "condition_id", null: false, comment: "Condition_id", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
    t.string "label", default: "", null: false, comment: "Label"
    t.index ["condition_id"], name: "FK_2AE51875AF0CD885E7FF189617DF0590"
  end

  create_table "amasty_rma_message", primary_key: "message_id", id: { type: :integer, comment: "Message_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Message Table", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "Request_id", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created_at"
    t.string "name", default: "", null: false, comment: "Name"
    t.text "message", null: false, comment: "Message"
    t.integer "customer_id", null: false, comment: "Customer_id", unsigned: true
    t.integer "manager_id", null: false, comment: "Manager_id", unsigned: true
    t.boolean "is_system", default: false, null: false, comment: "Is_system"
    t.boolean "is_manager", default: false, null: false, comment: "Is_manager"
    t.boolean "is_read", default: false, null: false, comment: "Is_read"
  end

  create_table "amasty_rma_message_file", primary_key: "message_file_id", id: { type: :integer, comment: "Message_file_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Message File Table", force: :cascade do |t|
    t.integer "message_id", null: false, comment: "Message_id", unsigned: true
    t.string "filepath", default: "", null: false, comment: "Filepath"
    t.string "filename", default: "", null: false, comment: "Filename"
    t.string "url_hash", limit: 32, default: "", null: false, comment: "Url_hash"
    t.index ["message_id"], name: "AMASTY_RMA_MESSAGE_FILE_MESSAGE_ID_AMASTY_RMA_MESSAGE_MESSAGE_ID"
  end

  create_table "amasty_rma_reason", primary_key: "reason_id", id: { type: :integer, comment: "Reason_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Return Reasons Table", force: :cascade do |t|
    t.string "title", default: "", null: false, comment: "Title"
    t.integer "payer", limit: 2, default: 0, null: false, comment: "Payer"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position"
    t.boolean "is_deleted", null: false, comment: "Is_deleted"
  end

  create_table "amasty_rma_reason_store", primary_key: "reason_store_id", id: { type: :integer, comment: "Reason_store_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Reason Stores Table", force: :cascade do |t|
    t.integer "reason_id", null: false, comment: "Reason_id", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
    t.string "label", default: "", null: false, comment: "Label"
    t.index ["reason_id"], name: "AMASTY_RMA_REASON_STORE_REASON_ID_AMASTY_RMA_REASON_REASON_ID"
  end

  create_table "amasty_rma_request", primary_key: "request_id", id: { type: :integer, comment: "Request_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Request Table", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order_id", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created_at"
    t.timestamp "modified_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Modified_at"
    t.integer "status", null: false, comment: "Status", unsigned: true
    t.integer "customer_id", null: false, comment: "Customer_id", unsigned: true
    t.text "customer_name", null: false, comment: "Customer_name"
    t.string "url_hash", null: false, comment: "Url_hash"
    t.integer "manager_id", null: false, comment: "Manager_id", unsigned: true
    t.text "custom_fields", null: false, comment: "Custom_fields"
    t.integer "rating", limit: 2, null: false, comment: "Rating", unsigned: true
    t.text "rating_comment", comment: "Rating_comment"
    t.text "note", comment: "Note"
    t.string "shipping_label", comment: "Shipping_label"
  end

  create_table "amasty_rma_request_item", primary_key: "request_item_id", id: { type: :integer, comment: "Request_item_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Request Items Table", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "Request_id", unsigned: true
    t.integer "order_item_id", null: false, comment: "Order_item_id", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", comment: "Qty"
    t.decimal "request_qty", precision: 12, scale: 4, default: "0.0", comment: "Request_qty"
    t.integer "reason_id", null: false, comment: "Reason_id", unsigned: true
    t.integer "condition_id", null: false, comment: "Condition_id", unsigned: true
    t.integer "resolution_id", null: false, comment: "Resolution_id", unsigned: true
    t.integer "item_status", limit: 2, default: 0, null: false, comment: "Item_status"
    t.index ["request_id"], name: "AMASTY_RMA_REQUEST_ITEM_REQUEST_ID_AMASTY_RMA_REQUEST_REQUEST_ID"
  end

  create_table "amasty_rma_resolution", primary_key: "resolution_id", id: { type: :integer, comment: "Resolution_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Resolutions Table", force: :cascade do |t|
    t.string "title", default: "", null: false, comment: "Title"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position"
    t.boolean "is_deleted", null: false, comment: "Is_deleted"
  end

  create_table "amasty_rma_resolution_store", primary_key: "resolution_store_id", id: { type: :integer, comment: "Resolution_store_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Resolutions Stores Table", force: :cascade do |t|
    t.integer "resolution_id", null: false, comment: "Resolution_id", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
    t.string "label", default: "", null: false, comment: "Label"
    t.index ["resolution_id"], name: "FK_C21BC2C5A88ED9E15961FB0B07D80048"
  end

  create_table "amasty_rma_return_rules", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Amasty Rma return rules table", force: :cascade do |t|
    t.string "name", limit: 225, null: false, comment: "Return Rule Name"
    t.boolean "status", null: false, comment: "Status"
    t.integer "priority", null: false, comment: "Priority of rule"
    t.integer "default_resolution", comment: "Default resolution period"
    t.text "conditions_serialized", null: false, comment: "Serialized Conditions"
  end

  create_table "amasty_rma_return_rules_customer_groups", primary_key: "rule_customer_group_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Rma return rules customer groups table", force: :cascade do |t|
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.index ["customer_group_id"], name: "FK_6EEEF04D9F995F32BE4A474E341A55A6"
    t.index ["rule_id"], name: "FK_5B74433CD256510C87EAC89DE35FC059"
  end

  create_table "amasty_rma_return_rules_resolutions", primary_key: "rule_resolution_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Rma return rules resolutions table", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "resolution_id", null: false, comment: "Resolution ID", unsigned: true
    t.integer "value", comment: "Resolution Value", unsigned: true
    t.index ["resolution_id"], name: "FK_F1EB7F075D2D853BC64A269BAF937D7E"
    t.index ["rule_id"], name: "FK_47F426414767D2E1306A79850D3A44EE"
  end

  create_table "amasty_rma_return_rules_websites", primary_key: "rule_website_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Amasty Rma return rules websites table", force: :cascade do |t|
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.index ["rule_id"], name: "AMASTY_RMA_RETURN_RULES_WSS_RULE_ID_AMASTY_RMA_RETURN_RULES_ID"
    t.index ["website_id"], name: "AMASTY_RMA_RETURN_RULES_WSS_WS_ID_STORE_WS_WS_ID"
  end

  create_table "amasty_rma_status", primary_key: "status_id", id: { type: :integer, comment: "Status_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Status Table", force: :cascade do |t|
    t.string "title", default: "", null: false, comment: "Title"
    t.boolean "is_enabled", default: true, null: false, comment: "Is_enabled"
    t.boolean "is_initial", null: false, comment: "Is_initial"
    t.integer "auto_event", limit: 2, default: 0, comment: "Auto_event"
    t.integer "state", limit: 2, default: 0, null: false, comment: "State"
    t.integer "grid", limit: 2, default: 0, null: false, comment: "Grid"
    t.integer "priority", default: 0, null: false, comment: "Priority"
    t.string "color", default: "0", null: false, comment: "Color"
    t.boolean "is_deleted", null: false, comment: "Is_deleted"
  end

  create_table "amasty_rma_status_store", primary_key: "status_store_id", id: { type: :integer, comment: "Status_store_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Status Stores Table", force: :cascade do |t|
    t.integer "status_id", null: false, comment: "Status_id", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
    t.string "label", default: "", null: false, comment: "Label"
    t.text "description", null: false, comment: "Description"
    t.boolean "send_email_to_customer", null: false, comment: "Send_email_to_customer"
    t.integer "customer_email_template", null: false, comment: "Customer_email_template", unsigned: true
    t.text "customer_custom_text", null: false, comment: "Customer_custom_text"
    t.boolean "send_email_to_admin", null: false, comment: "Send_email_to_admin"
    t.integer "admin_email_template", null: false, comment: "Admin_email_template", unsigned: true
    t.text "admin_custom_text", null: false, comment: "Admin_custom_text"
    t.boolean "send_to_chat", null: false, comment: "Send_to_chat"
    t.text "chat_message", null: false, comment: "Chat_message"
    t.index ["status_id"], name: "AMASTY_RMA_STATUS_STORE_STATUS_ID_AMASTY_RMA_STATUS_STATUS_ID"
  end

  create_table "amasty_rma_tracking", primary_key: "tracking_id", id: { type: :integer, comment: "Tracking_id", unsigned: true }, charset: "utf8", comment: "Amasty RMA Tracking Number Table", force: :cascade do |t|
    t.integer "request_id", null: false, comment: "Request_id", unsigned: true
    t.string "tracking_code", null: false, comment: "Tracking_code"
    t.string "tracking_number", null: false, comment: "Tracking_number"
    t.boolean "is_customer", default: true, null: false, comment: "Is_customer"
  end

  create_table "amasty_store_credit", primary_key: "store_credit_id", id: { type: :integer, comment: "Store_credit_id", unsigned: true }, charset: "utf8", comment: "Amasty Store Credit Table", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer_id", unsigned: true
    t.decimal "store_credit", precision: 12, scale: 4, null: false, comment: "Store_credit", unsigned: true
  end

  create_table "amasty_store_credit_history", primary_key: "history_id", id: { type: :integer, comment: "History_id", unsigned: true }, charset: "utf8", comment: "Amasty Store Credit History Table", force: :cascade do |t|
    t.integer "customer_history_id", null: false, comment: "Customer_history_id", unsigned: true
    t.integer "customer_id", null: false, comment: "Customer_id", unsigned: true
    t.boolean "is_deduct", default: false, null: false, comment: "Is_deduct"
    t.decimal "difference", precision: 12, scale: 4, null: false, comment: "Difference", unsigned: true
    t.decimal "store_credit_balance", precision: 12, scale: 4, null: false, comment: "Store_credit_balance", unsigned: true
    t.integer "action", limit: 2, null: false, comment: "Action", unsigned: true
    t.string "action_data", default: "[]", comment: "Action_data"
    t.text "message", comment: "Message"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created_at"
    t.integer "store_id", limit: 2, null: false, comment: "Store_id", unsigned: true
  end

  create_table "amazon_customer", primary_key: "entity_id", id: { type: :integer, comment: "Entity_id", unsigned: true }, charset: "utf8", comment: "amazon_customer", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer_id", unsigned: true
    t.string "amazon_id", null: false, comment: "Amazon_id"
    t.index ["customer_id", "amazon_id"], name: "AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID", unique: true
    t.index ["customer_id"], name: "AMAZON_CUSTOMER_CUSTOMER_ID", unique: true
  end

  create_table "amazon_pending_authorization", primary_key: "entity_id", id: { type: :integer, comment: "Entity_id", unsigned: true }, charset: "utf8", comment: "amazon_pending_authorization", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order_id", unsigned: true
    t.integer "payment_id", null: false, comment: "Payment_id", unsigned: true
    t.string "authorization_id", comment: "Authorization_id"
    t.datetime "created_at", null: false, comment: "Created_at"
    t.datetime "updated_at", comment: "Updated_at"
    t.integer "processed", limit: 2, default: 0, comment: "Initial authorization processed", unsigned: true
    t.integer "capture", limit: 2, default: 0, comment: "Initial authorization has capture", unsigned: true
    t.string "capture_id", comment: "Initial authorization capture id"
    t.index ["order_id", "payment_id", "authorization_id"], name: "UNQ_E6CCA08713FB32BB136A56837009C371", unique: true
  end

  create_table "amazon_pending_capture", primary_key: "entity_id", id: { type: :integer, comment: "Entity_id", unsigned: true }, charset: "utf8", comment: "amazon_pending_capture", force: :cascade do |t|
    t.string "capture_id", null: false, comment: "Capture_id"
    t.datetime "created_at", null: false, comment: "Created_at"
    t.integer "order_id", null: false, comment: "order id", unsigned: true
    t.integer "payment_id", null: false, comment: "payment id", unsigned: true
    t.index ["order_id", "payment_id", "capture_id"], name: "AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID", unique: true
  end

  create_table "amazon_pending_refund", primary_key: "entity_id", id: { type: :integer, comment: "Entity_id", unsigned: true }, charset: "utf8", comment: "amazon_pending_refund", force: :cascade do |t|
    t.string "refund_id", null: false, comment: "Refund_id"
    t.datetime "created_at", null: false, comment: "Created_at"
    t.integer "order_id", null: false, comment: "Order_id", unsigned: true
    t.integer "payment_id", null: false, comment: "Payment_id", unsigned: true
    t.index ["order_id", "payment_id", "refund_id"], name: "AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID", unique: true
  end

  create_table "amazon_quote", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "amazon_quote", force: :cascade do |t|
    t.integer "quote_id", null: false, comment: "Quote ID", unsigned: true
    t.string "amazon_order_reference_id", null: false, comment: "Amazon Order Reference ID"
    t.string "sandbox_simulation_reference", comment: "Sandbox simulation reference"
    t.integer "confirmed", limit: 2, default: 0, null: false, comment: "Quote confirmed with Amazon", unsigned: true
    t.index ["quote_id"], name: "AMAZON_QUOTE_QUOTE_ID", unique: true
  end

  create_table "amazon_sales_order", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "amazon_sales_order", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.string "amazon_order_reference_id", null: false, comment: "Amazon Order Reference ID"
    t.index ["order_id"], name: "AMAZON_SALES_ORDER_ORDER_ID", unique: true
  end

  create_table "app_account_posts", charset: "latin1", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_app_account_posts_on_account_id"
    t.index ["post_id"], name: "index_app_account_posts_on_post_id"
  end

  create_table "app_account_preferences", charset: "latin1", force: :cascade do |t|
    t.integer "magento_category_id"
    t.integer "level", comment: "Optional field to denote the level of category 0 denotes main category, 1 denotes sub category and so on"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.index ["account_id"], name: "index_app_account_preferences_on_account_id"
  end

  create_table "app_accounts", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "email", comment: "Email"
    t.string "firstname", comment: "First Name"
    t.string "middlename", comment: "Middle Name/Initial"
    t.string "lastname", comment: "Last Name"
    t.text "description", size: :medium
    t.string "city"
    t.datetime "birthday"
    t.integer "gender"
    t.string "interest"
    t.string "provider"
    t.text "provider_token", size: :medium
    t.string "type", null: false
    t.string "jwt_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "oauth_token"
    t.string "social_login_token"
    t.string "otp_code"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "phone_number"
    t.string "magento_id", comment: "Magento customer id"
    t.integer "role"
    t.boolean "is_seller", default: false
    t.string "seller_phone_number", comment: "UAE format +971"
    t.string "seller_web_url"
    t.string "seller_store_address"
    t.boolean "is_influencer", default: false
    t.datetime "magento_updated_at"
    t.string "profile_img"
    t.index ["email"], name: "CUSTOMER_EMAIL_ID"
    t.index ["firstname"], name: "CUSTOMER_ENTITY_FIRSTNAME"
    t.index ["lastname"], name: "CUSTOMER_ENTITY_LASTNAME"
  end

  create_table "app_catalogue_product_attrs", charset: "latin1", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "product_id"
    t.integer "views_count", default: 0
    t.integer "carts_count", default: 0
    t.integer "likes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_app_catalogue_product_attrs_on_customer_id"
  end

  create_table "app_customer_entity_preferences", charset: "latin1", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "kind"
    t.string "preference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_app_customer_entity_preferences_on_customer_id"
  end

  create_table "app_followers", charset: "latin1", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "follow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_app_followers_on_account_id"
  end

  create_table "app_items", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "content_type"
    t.integer "content_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.bigint "parent_id"
    t.text "reshare_caption", size: :medium
    t.bigint "parent_product_id"
    t.float "quantity", default: 0.0
    t.index ["account_id"], name: "index_app_items_on_account_id"
    t.index ["content_id", "content_type"], name: "index_app_items_on_content_id_and_content_type"
  end

  create_table "app_posts", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "post_type"
    t.bigint "account_id", null: false
    t.text "content", size: :medium
    t.text "caption", size: :medium
    t.boolean "is_shared", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.text "reshare_caption", size: :medium
    t.integer "item_id"
    t.index ["account_id"], name: "index_app_posts_on_account_id"
  end

  create_table "app_reactions", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.bigint "account_id", null: false
    t.string "reaction_type", default: "heart"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_app_reactions_on_account_id"
    t.index ["resource_type", "resource_id"], name: "index_reactions_on_resource"
  end

  create_table "app_reviews", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "account_id"
    t.string "relatable_type"
    t.bigint "relatable_id"
    t.text "comment", size: :medium
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.integer "rating", default: 0
    t.index ["account_id"], name: "index_app_reviews_on_account_id"
    t.index ["relatable_type", "relatable_id"], name: "index_app_reviews_on_relatable"
  end

  create_table "app_tags", charset: "latin1", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.integer "tagable_id"
    t.string "tagable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_app_tags_on_account_id"
  end

  create_table "app_user_posts", charset: "latin1", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "parent_id"
    t.boolean "is_shared", default: false
    t.string "post_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_app_user_posts_on_customer_id"
    t.index ["parent_id"], name: "index_app_user_posts_on_parent_id"
  end

  create_table "app_wishlisted_items", charset: "latin1", force: :cascade do |t|
    t.integer "account_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wishlist_id"
    t.index ["wishlist_id"], name: "index_app_wishlisted_items_on_wishlist_id"
  end

  create_table "app_wishlists", charset: "latin1", force: :cascade do |t|
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_app_wishlists_on_account_id"
  end

  create_table "authorization_role", primary_key: "role_id", id: { type: :integer, comment: "Role ID", unsigned: true }, charset: "utf8", comment: "Admin Role Table", force: :cascade do |t|
    t.integer "parent_id", default: 0, null: false, comment: "Parent Role ID", unsigned: true
    t.integer "tree_level", limit: 2, default: 0, null: false, comment: "Role Tree Level", unsigned: true
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Role Sort Order", unsigned: true
    t.string "role_type", limit: 1, default: "0", null: false, comment: "Role Type"
    t.integer "user_id", default: 0, null: false, comment: "User ID", unsigned: true
    t.string "user_type", limit: 16, comment: "User Type"
    t.string "role_name", limit: 50, comment: "Role Name"
    t.index ["parent_id", "sort_order"], name: "AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER"
    t.index ["tree_level"], name: "AUTHORIZATION_ROLE_TREE_LEVEL"
  end

  create_table "authorization_rule", primary_key: "rule_id", id: { type: :integer, comment: "Rule ID", unsigned: true }, charset: "utf8", comment: "Admin Rule Table", force: :cascade do |t|
    t.integer "role_id", default: 0, null: false, comment: "Role ID", unsigned: true
    t.string "resource_id", comment: "Resource ID"
    t.string "privileges", limit: 20, comment: "Privileges"
    t.string "permission", limit: 10, comment: "Permission"
    t.index ["resource_id", "role_id"], name: "AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID"
    t.index ["role_id", "resource_id"], name: "AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID"
  end

  create_table "braintree_credit_prices", id: { type: :integer, comment: "Row ID", unsigned: true }, charset: "utf8", comment: "Braintree credit rates", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product Id", unsigned: true
    t.integer "term", null: false, comment: "Credit Term"
    t.decimal "monthly_payment", precision: 12, scale: 2, null: false, comment: "Monthly Payment"
    t.decimal "instalment_rate", precision: 12, scale: 2, null: false, comment: "Instalment Rate"
    t.decimal "cost_of_purchase", precision: 12, scale: 2, null: false, comment: "Cost of purchase"
    t.decimal "total_inc_interest", precision: 12, scale: 2, null: false, comment: "Total Inc Interest"
    t.index ["product_id", "term"], name: "BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM", unique: true
    t.index ["product_id"], name: "BRAINTREE_CREDIT_PRICES_PRODUCT_ID"
  end

  create_table "braintree_transaction_details", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Braintree transaction details table", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order Id", unsigned: true
    t.string "transaction_source", limit: 12, comment: "Transaction Source"
    t.index ["order_id"], name: "BRAINTREE_TRANSACTION_DETAILS_ORDER_ID"
  end

  create_table "brand_infos", charset: "latin1", force: :cascade do |t|
    t.string "seller_name"
    t.string "seller_img"
    t.bigint "app_items_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_items_id"], name: "index_brand_infos_on_app_items_id"
  end

  create_table "brands_url_rewrite", primary_key: "brand_url_rewrite_id", id: { type: :integer, comment: "Brand Url Rewrite ID", unsigned: true }, charset: "utf8", comment: "Brand Url Rewrite", force: :cascade do |t|
    t.string "entity_type", limit: 32, null: false, comment: "Entity type code"
    t.integer "reference_id", null: false, comment: "Brand Entity ID", unsigned: true
    t.string "request_path", comment: "Request Path"
    t.string "target_path", comment: "Target Path"
    t.index ["request_path"], name: "BRANDS_URL_REWRITE_REQUEST_PATH", unique: true
    t.index ["target_path"], name: "BRANDS_URL_REWRITE_TARGET_PATH"
  end

  create_table "bss_gift_card_visibility", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Bss Gift Card Visibility", force: :cascade do |t|
    t.integer "store_id", comment: "Store Id"
    t.integer "product_id", comment: "Product Id"
    t.integer "value", comment: "Value"
    t.index ["id"], name: "BSS_GIFT_CARD_VISIBILITY_ID"
  end

  create_table "bss_giftcard_amounts", primary_key: "amount_id", id: { type: :integer, comment: "Amount ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_amounts", force: :cascade do |t|
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Value"
    t.decimal "price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Price"
    t.integer "website_id", limit: 2, comment: "Website Id", unsigned: true
    t.integer "product_id", null: false, comment: "Product Id", unsigned: true
    t.index ["product_id"], name: "BSS_GIFTCARD_AMOUNTS_PRODUCT_ID"
    t.index ["website_id"], name: "BSS_GIFTCARD_AMOUNTS_WEBSITE_ID"
  end

  create_table "bss_giftcard_history", primary_key: "history_id", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_history", force: :cascade do |t|
    t.integer "code_id", null: false, comment: "Code Id", unsigned: true
    t.integer "quote_id", comment: "Quote Id", unsigned: true
    t.decimal "amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Amount"
    t.timestamp "created_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated Time"
    t.index ["code_id"], name: "BSS_GIFTCARD_HISTORY_CODE_ID"
    t.index ["quote_id"], name: "BSS_GIFTCARD_HISTORY_QUOTE_ID"
  end

  create_table "bss_giftcard_pattern", primary_key: "pattern_id", id: { type: :integer, comment: "Pattern ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_pattern", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.string "pattern", comment: "Pattern"
    t.integer "pattern_code_qty", default: 0, null: false, comment: "Total Qty Code", unsigned: true
    t.integer "pattern_code_unused", default: 0, null: false, comment: "Total Qty Unused Code", unsigned: true
    t.integer "pattern_code_qty_max", default: 0, null: false, comment: "Total Qty Code Max", unsigned: true
    t.timestamp "created_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated Time"
    t.index ["pattern"], name: "BSS_GIFTCARD_PATTERN_PATTERN"
  end

  create_table "bss_giftcard_pattern_code", primary_key: "code_id", id: { type: :integer, comment: "Code ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_pattern_code", force: :cascade do |t|
    t.string "code", comment: "Code"
    t.integer "pattern_id", null: false, comment: "Pattern Id", unsigned: true
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Value"
    t.decimal "origin_value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Origin Value"
    t.integer "order_id", comment: "Order Id", unsigned: true
    t.integer "product_id", comment: "Product Id", unsigned: true
    t.integer "sent", limit: 2, default: 1, null: false, comment: "Sent", unsigned: true
    t.timestamp "send_at", comment: "Send At"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
    t.string "sender_name", comment: "Sender Name"
    t.string "recipient_name", comment: "Recipient Name"
    t.string "recipient_email", comment: "Recipient Email"
    t.string "sender_email", comment: "Sender Email"
    t.string "message", comment: "Message"
    t.integer "image_id", comment: "Image Id", unsigned: true
    t.timestamp "expiry_day", comment: "Expiry Day"
    t.timestamp "created_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated Time"
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website Id", unsigned: true
    t.integer "sent_expire_notify", limit: 2, default: 0, null: false, comment: "Was sent Notification Email about Expire code", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id", unsigned: true
    t.index ["code"], name: "BSS_GIFTCARD_PATTERN_CODE_CODE"
    t.index ["order_id"], name: "BSS_GIFTCARD_PATTERN_CODE_ORDER_ID_SALES_ORDER_ENTITY_ID"
    t.index ["pattern_id"], name: "BSS_GIFTCARD_PATTERN_CODE_PATTERN_ID"
    t.index ["product_id"], name: "BSS_GIFTCARD_PATTERN_CODE_PRD_ID_CAT_PRD_ENTT_ENTT_ID"
  end

  create_table "bss_giftcard_product_template", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_product_template", force: :cascade do |t|
    t.integer "template_id", null: false, comment: "Template Id", unsigned: true
    t.integer "product_id", null: false, comment: "Product Id", unsigned: true
    t.index ["product_id"], name: "BSS_GIFTCARD_PRODUCT_TEMPLATE_PRODUCT_ID"
    t.index ["template_id"], name: "BSS_GIFTCARD_PRODUCT_TEMPLATE_TEMPLATE_ID"
  end

  create_table "bss_giftcard_quote", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_quote", force: :cascade do |t|
    t.integer "quote_id", null: false, comment: "Quote Id", unsigned: true
    t.string "giftcard_code", comment: "Gift Card Code"
    t.decimal "base_giftcard_amount", precision: 12, scale: 2, comment: "Base Gift Card Amount", unsigned: true
    t.decimal "giftcard_amount", precision: 12, scale: 2, comment: "Gift Card Amount", unsigned: true
    t.index ["giftcard_code"], name: "BSS_GIFTCARD_QUOTE_GIFTCARD_CODE"
    t.index ["quote_id"], name: "BSS_GIFTCARD_QUOTE_QUOTE_ID"
  end

  create_table "bss_giftcard_template", primary_key: "template_id", id: { type: :integer, comment: "Template ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_template", force: :cascade do |t|
    t.string "name", comment: "Template name"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Template Status", unsigned: true
    t.string "code_color", limit: 10, comment: "Gift code color"
    t.string "message_color", limit: 10, comment: "Gift card message text color"
    t.timestamp "created_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated Time"
    t.index ["status"], name: "BSS_GIFTCARD_TEMPLATE_STATUS"
    t.index ["template_id"], name: "BSS_GIFTCARD_TEMPLATE_TEMPLATE_ID"
  end

  create_table "bss_giftcard_template_images", primary_key: "value_id", id: { type: :integer, comment: "Image ID", unsigned: true }, charset: "utf8", comment: "bss_giftcard_template_images", force: :cascade do |t|
    t.string "value", comment: "Value"
    t.integer "template_id", null: false, comment: "Template Id", unsigned: true
    t.integer "position", limit: 2, comment: "Position", unsigned: true
    t.string "label", comment: "Alt"
    t.index ["template_id"], name: "BSS_GIFTCARD_TEMPLATE_IMAGES_TEMPLATE_ID"
  end

  create_table "cache", id: { type: :string, limit: 200, comment: "Cache Id" }, charset: "utf8", comment: "Caches", force: :cascade do |t|
    t.binary "data", size: :medium, comment: "Cache Data"
    t.integer "create_time", comment: "Cache Creation Time"
    t.integer "update_time", comment: "Time of Cache Updating"
    t.integer "expire_time", comment: "Cache Expiration Time"
    t.index ["expire_time"], name: "CACHE_EXPIRE_TIME"
  end

  create_table "cache_tag", primary_key: ["tag", "cache_id"], charset: "utf8", comment: "Tag Caches", force: :cascade do |t|
    t.string "tag", limit: 100, null: false, comment: "Tag"
    t.string "cache_id", limit: 200, null: false, comment: "Cache Id"
    t.index ["cache_id"], name: "CACHE_TAG_CACHE_ID"
  end

  create_table "campaigns", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Campaigns", force: :cascade do |t|
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
    t.integer "include_in_menu", limit: 2, default: 0, null: false, comment: "Campaign - include in menu", unsigned: true
    t.string "event_title", null: false, comment: "Campaign Title"
    t.text "event_description", comment: "Campaign Description"
    t.string "event_url_key", null: false, comment: "Campaign Url Key"
    t.string "event_image", comment: "Campaign Image"
    t.text "event_meta_key", comment: "Campaign Meta key"
    t.text "event_meta_description", comment: "Campaign Meta Description"
    t.datetime "event_start", null: false, comment: "Campaign start"
    t.datetime "event_end", null: false, comment: "Campaign End"
    t.integer "is_featured_event", limit: 2, default: 0, null: false, comment: "Is Featured", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "campaigns_product", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Campaigns Products", force: :cascade do |t|
    t.integer "event_id", default: 0, null: false, comment: "Campaigns id"
    t.integer "product_id", default: 0, null: false, comment: "Campaigns product id"
    t.integer "position", default: 0, null: false
  end

  create_table "campaigns_url_rewrite", primary_key: "event_url_rewrite_id", id: { type: :integer, comment: "Campaigns Url Rewrite ID", unsigned: true }, charset: "utf8", comment: "Campaigns Url Rewrite", force: :cascade do |t|
    t.string "entity_type", limit: 32, null: false, comment: "Entity type code"
    t.integer "reference_id", null: false, comment: "Event Entity ID", unsigned: true
    t.string "request_path", comment: "Request Path"
    t.string "target_path", comment: "Target Path"
    t.index ["request_path"], name: "CAMPAIGNS_URL_REWRITE_REQUEST_PATH", unique: true
    t.index ["target_path"], name: "CAMPAIGNS_URL_REWRITE_TARGET_PATH"
  end

  create_table "captcha_log", primary_key: ["type", "value"], charset: "utf8", comment: "Count Login Attempts", force: :cascade do |t|
    t.string "type", limit: 32, null: false, comment: "Type"
    t.string "value", null: false, comment: "Value"
    t.integer "count", default: 0, null: false, comment: "Count", unsigned: true
    t.timestamp "updated_at", comment: "Update Time"
  end

  create_table "catalog_category_entity", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Catalog Category Table", force: :cascade do |t|
    t.integer "attribute_set_id", limit: 2, default: 0, null: false, comment: "Attribute Set ID", unsigned: true
    t.integer "parent_id", default: 0, null: false, comment: "Parent Category ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Update Time"
    t.string "path", null: false, comment: "Tree Path"
    t.integer "position", null: false, comment: "Position"
    t.integer "level", default: 0, null: false, comment: "Tree Level"
    t.integer "children_count", null: false, comment: "Child Count"
    t.index ["level"], name: "CATALOG_CATEGORY_ENTITY_LEVEL"
    t.index ["path"], name: "CATALOG_CATEGORY_ENTITY_PATH"
  end

  create_table "catalog_category_entity_datetime", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Category Datetime Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.datetime "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID"
  end

  create_table "catalog_category_entity_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Category Decimal Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.decimal "value", precision: 20, scale: 6, comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID"
  end

  create_table "catalog_category_entity_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Category Integer Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_CATEGORY_ENTITY_INT_STORE_ID"
  end

  create_table "catalog_category_entity_text", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Category Text Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.text "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID"
  end

  create_table "catalog_category_entity_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Category Varchar Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID"
  end

  create_table "catalog_category_product", primary_key: ["entity_id", "category_id", "product_id"], charset: "utf8", comment: "Catalog Product To Category Linkage Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", auto_increment: true
    t.integer "category_id", default: 0, null: false, comment: "Category ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position"
    t.index ["category_id", "product_id"], name: "CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "CATALOG_CATEGORY_PRODUCT_PRODUCT_ID"
  end

  create_table "catalog_category_product_index", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION"
  end

  create_table "catalog_category_product_index_replica", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION"
  end

  create_table "catalog_category_product_index_store1", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index Store1 Replica", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category Id", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product Id", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "IDX_47AB760CD6A893ACEA69A9C2E0112C60"
  end

  create_table "catalog_category_product_index_store1_replica", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index Store1", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category Id", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product Id", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "IDX_216E521C8AD125E066D2B0BAB4A08412"
  end

  create_table "catalog_category_product_index_store2", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index Store2", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category Id", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product Id", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "CAT_CTGR_PRD_IDX_STORE2_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "IDX_2AB6FE58F086547FA7E4590837296849"
  end

  create_table "catalog_category_product_index_store2_replica", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Index Store2 Replica", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category Id", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product Id", unsigned: true
    t.integer "position", comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store Id", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "store_id", "category_id", "visibility"], name: "IDX_87FCED52F67C72BB6992C79EB4DCFA8A"
    t.index ["store_id", "category_id", "visibility", "is_parent", "position"], name: "IDX_15B841C92B67D986A980051DF109F9D1"
  end

  create_table "catalog_category_product_index_tmp", primary_key: ["category_id", "product_id", "store_id"], charset: "utf8", comment: "Catalog Category Product Indexer temporary table", force: :cascade do |t|
    t.integer "category_id", default: 0, null: false, comment: "Category ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position"
    t.integer "is_parent", limit: 2, default: 0, null: false, comment: "Is Parent", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "visibility", limit: 2, null: false, comment: "Visibility", unsigned: true
    t.index ["product_id", "category_id", "store_id"], name: "CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID"
  end

  create_table "catalog_compare_item", primary_key: "catalog_compare_item_id", id: { type: :integer, comment: "Compare Item ID", unsigned: true }, charset: "utf8", comment: "Catalog Compare Table", force: :cascade do |t|
    t.integer "visitor_id", default: 0, null: false, comment: "Visitor ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.index ["customer_id", "product_id"], name: "CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID"
    t.index ["product_id"], name: "CATALOG_COMPARE_ITEM_PRODUCT_ID"
    t.index ["store_id"], name: "CATALOG_COMPARE_ITEM_STORE_ID"
    t.index ["visitor_id", "product_id"], name: "CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID"
  end

  create_table "catalog_eav_attribute", primary_key: "attribute_id", id: { type: :integer, limit: 2, comment: "Attribute ID", unsigned: true, default: nil }, charset: "utf8", comment: "Catalog EAV Attribute Table", force: :cascade do |t|
    t.string "frontend_input_renderer", comment: "Frontend Input Renderer"
    t.integer "is_global", limit: 2, default: 1, null: false, comment: "Is Global", unsigned: true
    t.integer "is_visible", limit: 2, default: 1, null: false, comment: "Is Visible", unsigned: true
    t.integer "is_searchable", limit: 2, default: 0, null: false, comment: "Is Searchable", unsigned: true
    t.integer "is_filterable", limit: 2, default: 0, null: false, comment: "Is Filterable", unsigned: true
    t.integer "is_comparable", limit: 2, default: 0, null: false, comment: "Is Comparable", unsigned: true
    t.integer "is_visible_on_front", limit: 2, default: 0, null: false, comment: "Is Visible On Front", unsigned: true
    t.integer "is_html_allowed_on_front", limit: 2, default: 0, null: false, comment: "Is HTML Allowed On Front", unsigned: true
    t.integer "is_used_for_price_rules", limit: 2, default: 0, null: false, comment: "Is Used For Price Rules", unsigned: true
    t.integer "is_filterable_in_search", limit: 2, default: 0, null: false, comment: "Is Filterable In Search", unsigned: true
    t.integer "used_in_product_listing", limit: 2, default: 0, null: false, comment: "Is Used In Product Listing", unsigned: true
    t.integer "used_for_sort_by", limit: 2, default: 0, null: false, comment: "Is Used For Sorting", unsigned: true
    t.string "apply_to", comment: "Apply To"
    t.integer "is_visible_in_advanced_search", limit: 2, default: 0, null: false, comment: "Is Visible In Advanced Search", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position"
    t.integer "is_wysiwyg_enabled", limit: 2, default: 0, null: false, comment: "Is WYSIWYG Enabled", unsigned: true
    t.integer "is_used_for_promo_rules", limit: 2, default: 0, null: false, comment: "Is Used For Promo Rules", unsigned: true
    t.integer "is_required_in_admin_store", limit: 2, default: 0, null: false, comment: "Is Required In Admin Store", unsigned: true
    t.integer "is_used_in_grid", limit: 2, default: 0, null: false, comment: "Is Used in Grid", unsigned: true
    t.integer "is_visible_in_grid", limit: 2, default: 0, null: false, comment: "Is Visible in Grid", unsigned: true
    t.integer "is_filterable_in_grid", limit: 2, default: 0, null: false, comment: "Is Filterable in Grid", unsigned: true
    t.float "search_weight", default: 1.0, null: false, comment: "Search Weight"
    t.text "additional_data", comment: "Additional swatch attributes data"
    t.index ["used_for_sort_by"], name: "CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY"
    t.index ["used_in_product_listing"], name: "CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING"
  end

  create_table "catalog_product_bundle_option", primary_key: "option_id", id: { type: :integer, comment: "Option ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Bundle Option", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "required", limit: 2, default: 0, null: false, comment: "Required", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position", unsigned: true
    t.string "type", comment: "Type"
    t.index ["parent_id"], name: "CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID"
  end

  create_table "catalog_product_bundle_option_value", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Bundle Option Value", force: :cascade do |t|
    t.integer "option_id", null: false, comment: "Option ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "title", comment: "Title"
    t.integer "parent_product_id", null: false, comment: "Parent Product ID", unsigned: true
    t.index ["option_id", "parent_product_id", "store_id"], name: "CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID", unique: true
  end

  create_table "catalog_product_bundle_price_index", primary_key: ["entity_id", "website_id", "customer_group_id"], charset: "utf8", comment: "Catalog Product Bundle Price Index", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, null: false, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, null: false, comment: "Max Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID"
    t.index ["website_id"], name: "CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID"
  end

  create_table "catalog_product_bundle_selection", primary_key: "selection_id", id: { type: :integer, comment: "Selection ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Bundle Selection", force: :cascade do |t|
    t.integer "option_id", null: false, comment: "Option ID", unsigned: true
    t.integer "parent_product_id", null: false, comment: "Parent Product ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position", unsigned: true
    t.integer "is_default", limit: 2, default: 0, null: false, comment: "Is Default", unsigned: true
    t.integer "selection_price_type", limit: 2, default: 0, null: false, comment: "Selection Price Type", unsigned: true
    t.decimal "selection_price_value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Selection Price Value"
    t.decimal "selection_qty", precision: 12, scale: 4, comment: "Selection Qty"
    t.integer "selection_can_change_qty", limit: 2, default: 0, null: false, comment: "Selection Can Change Qty"
    t.index ["option_id"], name: "CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID"
    t.index ["product_id"], name: "CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID"
  end

  create_table "catalog_product_bundle_selection_price", primary_key: ["selection_id", "parent_product_id", "website_id"], charset: "utf8", comment: "Catalog Product Bundle Selection Price", force: :cascade do |t|
    t.integer "selection_id", null: false, comment: "Selection ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "selection_price_type", limit: 2, default: 0, null: false, comment: "Selection Price Type", unsigned: true
    t.decimal "selection_price_value", precision: 20, scale: 6, default: "0.0", null: false, comment: "Selection Price Value"
    t.integer "parent_product_id", null: false, comment: "Parent Product ID", unsigned: true
    t.index ["website_id"], name: "CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID"
  end

  create_table "catalog_product_bundle_stock_index", primary_key: ["entity_id", "website_id", "stock_id", "option_id"], charset: "utf8", comment: "Catalog Product Bundle Stock Index", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "stock_id", limit: 2, null: false, comment: "Stock ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "stock_status", limit: 2, default: 0, comment: "Stock Status"
  end

  create_table "catalog_product_entity", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Table", force: :cascade do |t|
    t.integer "attribute_set_id", limit: 2, default: 0, null: false, comment: "Attribute Set ID", unsigned: true
    t.string "type_id", limit: 32, default: "simple", null: false, comment: "Type ID"
    t.string "sku", limit: 64, comment: "SKU"
    t.integer "has_options", limit: 2, default: 0, null: false, comment: "Has Options"
    t.integer "required_options", limit: 2, default: 0, null: false, comment: "Required Options", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Update Time"
    t.string "created_by", comment: "Created By"
    t.string "admin_id", comment: "admin_id"
    t.string "seller_id", comment: "seller_id"
    t.string "seller_name", comment: "created_by_seller"
    t.index ["attribute_set_id"], name: "CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID"
    t.index ["sku"], name: "CATALOG_PRODUCT_ENTITY_SKU"
  end

  create_table "catalog_product_entity_datetime", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Datetime Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.datetime "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID"
  end

  create_table "catalog_product_entity_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Decimal Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.decimal "value", precision: 20, scale: 6, comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID"
  end

  create_table "catalog_product_entity_gallery", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Gallery Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position"
    t.string "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_id"], name: "CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID"
  end

  create_table "catalog_product_entity_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Integer Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "value", comment: "Value"
    t.index ["attribute_id", "store_id", "value"], name: "CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_INT_STORE_ID"
  end

  create_table "catalog_product_entity_media_gallery", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Media Gallery Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.string "value", comment: "Value"
    t.string "media_type", limit: 32, default: "image", null: false, comment: "Media entry type"
    t.integer "disabled", limit: 2, default: 0, null: false, comment: "Visibility status", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID"
  end

  create_table "catalog_product_entity_media_gallery_value", primary_key: "record_id", id: { type: :integer, comment: "Record ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Media Gallery Attribute Value Table", force: :cascade do |t|
    t.integer "value_id", default: 0, null: false, comment: "Value ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "label", comment: "Label"
    t.integer "position", comment: "Position", unsigned: true
    t.integer "disabled", limit: 2, default: 0, null: false, comment: "Is Disabled", unsigned: true
    t.index ["entity_id", "value_id", "store_id"], name: "CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID"
    t.index ["entity_id"], name: "CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID"
    t.index ["value_id"], name: "CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID"
  end

  create_table "catalog_product_entity_media_gallery_value_to_entity", id: false, charset: "utf8", comment: "Link Media value to Product entity table", force: :cascade do |t|
    t.integer "value_id", null: false, comment: "Value media Entry ID", unsigned: true
    t.integer "entity_id", null: false, comment: "Product Entity ID", unsigned: true
    t.index ["entity_id"], name: "CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID"
    t.index ["value_id", "entity_id"], name: "CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID", unique: true
  end

  create_table "catalog_product_entity_media_gallery_value_video", id: false, charset: "utf8", comment: "Catalog Product Video Table", force: :cascade do |t|
    t.integer "value_id", null: false, comment: "Media Entity ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "provider", limit: 32, comment: "Video provider ID"
    t.text "url", comment: "Video URL"
    t.string "title", comment: "Title"
    t.text "description", comment: "Page Meta Description"
    t.text "metadata", comment: "Video meta data"
    t.index ["store_id"], name: "CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID"
    t.index ["value_id", "store_id"], name: "CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID", unique: true
  end

  create_table "catalog_product_entity_text", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Text Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.text "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID"
  end

  create_table "catalog_product_entity_tier_price", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Tier Price Attribute Backend Table", force: :cascade do |t|
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "all_groups", limit: 2, default: 1, null: false, comment: "Is Applicable To All Customer Groups", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "1.0", null: false, comment: "QTY"
    t.decimal "value", precision: 20, scale: 6, default: "0.0", null: false, comment: "Value"
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "percentage_value", precision: 5, scale: 2, comment: "Percentage value"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID"
    t.index ["entity_id", "all_groups", "customer_group_id", "qty", "website_id"], name: "UNQ_E8AB433B9ACB00343ABB312AD2FAB087", unique: true
    t.index ["website_id"], name: "CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID"
  end

  create_table "catalog_product_entity_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Catalog Product Varchar Attribute Backend Table", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID"
  end

  create_table "catalog_product_frontend_action", primary_key: "action_id", id: { type: :bigint, comment: "Product Action ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Frontend Action Table", force: :cascade do |t|
    t.string "type_id", limit: 64, null: false, comment: "Type of product action"
    t.integer "visitor_id", comment: "Visitor ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.bigint "added_at", null: false, comment: "Added At"
    t.index ["customer_id", "product_id", "type_id"], name: "CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID", unique: true
    t.index ["product_id"], name: "CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID"
    t.index ["visitor_id", "product_id", "type_id"], name: "CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID", unique: true
  end

  create_table "catalog_product_index_eav", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.integer "value", null: false, comment: "Value", unsigned: true
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_VALUE"
  end

  create_table "catalog_product_index_eav_decimal", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Decimal Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, null: false, comment: "Value"
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE"
  end

  create_table "catalog_product_index_eav_decimal_idx", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Decimal Indexer Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, null: false, comment: "Value"
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE"
  end

  create_table "catalog_product_index_eav_decimal_replica", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Decimal Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, null: false, comment: "Value"
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE"
  end

  create_table "catalog_product_index_eav_decimal_tmp", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Decimal Indexer Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, null: false, comment: "Value"
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE"
  end

  create_table "catalog_product_index_eav_idx", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Indexer Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.integer "value", null: false, comment: "Value", unsigned: true
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE"
  end

  create_table "catalog_product_index_eav_replica", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.integer "value", null: false, comment: "Value", unsigned: true
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_VALUE"
  end

  create_table "catalog_product_index_eav_tmp", primary_key: ["entity_id", "attribute_id", "store_id", "value", "source_id"], charset: "utf8", comment: "Catalog Product EAV Indexer Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.integer "value", null: false, comment: "Value", unsigned: true
    t.integer "source_id", default: 0, null: false, comment: "Original entity ID for attribute value", unsigned: true
    t.index ["attribute_id"], name: "CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID"
    t.index ["store_id"], name: "CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID"
    t.index ["value"], name: "CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE"
  end

  create_table "catalog_product_index_price", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "final_price", precision: 20, scale: 6, comment: "Final Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID"
    t.index ["min_price"], name: "CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE"
    t.index ["website_id", "customer_group_id", "min_price"], name: "CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE"
  end

  create_table "catalog_product_index_price_bundle_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Idx", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.integer "price_type", limit: 2, null: false, comment: "Price Type", unsigned: true
    t.decimal "special_price", precision: 20, scale: 6, comment: "Special Price"
    t.decimal "tier_percent", precision: 20, scale: 6, comment: "Tier Percent"
    t.decimal "orig_price", precision: 20, scale: 6, comment: "Orig Price"
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "base_tier", precision: 20, scale: 6, comment: "Base Tier"
  end

  create_table "catalog_product_index_price_bundle_opt_idx", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Opt Idx", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "alt_price", precision: 20, scale: 6, comment: "Alt Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "alt_tier_price", precision: 20, scale: 6, comment: "Alt Tier Price"
  end

  create_table "catalog_product_index_price_bundle_opt_tmp", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Opt Tmp", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "alt_price", precision: 20, scale: 6, comment: "Alt Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "alt_tier_price", precision: 20, scale: 6, comment: "Alt Tier Price"
  end

  create_table "catalog_product_index_price_bundle_sel_idx", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id", "selection_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Sel Idx", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "selection_id", default: 0, null: false, comment: "Selection ID", unsigned: true
    t.integer "group_type", limit: 2, default: 0, comment: "Group Type", unsigned: true
    t.integer "is_required", limit: 2, default: 0, comment: "Is Required", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_bundle_sel_tmp", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id", "selection_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Sel Tmp", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "selection_id", default: 0, null: false, comment: "Selection ID", unsigned: true
    t.integer "group_type", limit: 2, default: 0, comment: "Group Type", unsigned: true
    t.integer "is_required", limit: 2, default: 0, comment: "Is Required", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_bundle_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Index Price Bundle Tmp", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.integer "price_type", limit: 2, null: false, comment: "Price Type", unsigned: true
    t.decimal "special_price", precision: 20, scale: 6, comment: "Special Price"
    t.decimal "tier_percent", precision: 20, scale: 6, comment: "Tier Percent"
    t.decimal "orig_price", precision: 20, scale: 6, comment: "Orig Price"
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "base_tier", precision: 20, scale: 6, comment: "Base Tier"
  end

  create_table "catalog_product_index_price_cfg_opt_agr_idx", primary_key: ["parent_id", "child_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Config Option Aggregate Index Table", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "child_id", null: false, comment: "Child ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_cfg_opt_agr_tmp", primary_key: ["parent_id", "child_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Config Option Aggregate Temp Table", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "child_id", null: false, comment: "Child ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_cfg_opt_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Config Option Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_cfg_opt_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Config Option Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_downlod_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Indexer Table for price of downloadable products", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Minimum price"
    t.decimal "max_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Maximum price"
  end

  create_table "catalog_product_index_price_downlod_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Temporary Indexer Table for price of downloadable products", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Minimum price"
    t.decimal "max_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Maximum price"
  end

  create_table "catalog_product_index_price_final_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Final Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "orig_price", precision: 20, scale: 6, comment: "Original Price"
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "base_tier", precision: 20, scale: 6, comment: "Base Tier"
  end

  create_table "catalog_product_index_price_final_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Final Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "orig_price", precision: 20, scale: 6, comment: "Original Price"
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.decimal "base_tier", precision: 20, scale: 6, comment: "Base Tier"
  end

  create_table "catalog_product_index_price_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "final_price", precision: 20, scale: 6, comment: "Final Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID"
    t.index ["min_price"], name: "CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE"
    t.index ["website_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID"
  end

  create_table "catalog_product_index_price_opt_agr_idx", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id"], charset: "utf8", comment: "Catalog Product Price Indexer Option Aggregate Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_opt_agr_tmp", primary_key: ["entity_id", "customer_group_id", "website_id", "option_id"], charset: "utf8", comment: "Catalog Product Price Indexer Option Aggregate Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_opt_idx", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Option Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_opt_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Option Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
  end

  create_table "catalog_product_index_price_replica", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "final_price", precision: 20, scale: 6, comment: "Final Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID"
    t.index ["min_price"], name: "CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE"
    t.index ["website_id", "customer_group_id", "min_price"], name: "CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE"
  end

  create_table "catalog_product_index_price_tmp", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Price Indexer Temp Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "tax_class_id", limit: 2, default: 0, comment: "Tax Class ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, comment: "Price"
    t.decimal "final_price", precision: 20, scale: 6, comment: "Final Price"
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.decimal "max_price", precision: 20, scale: 6, comment: "Max Price"
    t.decimal "tier_price", precision: 20, scale: 6, comment: "Tier Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID"
    t.index ["min_price"], name: "CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE"
    t.index ["website_id"], name: "CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID"
  end

  create_table "catalog_product_index_tier_price", primary_key: ["entity_id", "customer_group_id", "website_id"], charset: "utf8", comment: "Catalog Product Tier Price Index Table", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.decimal "min_price", precision: 20, scale: 6, comment: "Min Price"
    t.index ["customer_group_id"], name: "CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID"
    t.index ["website_id"], name: "CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID"
  end

  create_table "catalog_product_index_website", primary_key: "website_id", id: { type: :integer, limit: 2, comment: "Website ID", unsigned: true, default: nil }, charset: "utf8", comment: "Catalog Product Website Index Table", force: :cascade do |t|
    t.integer "default_store_id", limit: 2, null: false, comment: "Default store ID for website", unsigned: true
    t.date "website_date", comment: "Website Date"
    t.float "rate", default: 1.0, comment: "Rate"
    t.index ["website_date"], name: "CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE"
  end

  create_table "catalog_product_link", primary_key: "link_id", id: { type: :integer, comment: "Link ID", unsigned: true }, charset: "utf8", comment: "Catalog Product To Product Linkage Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "linked_product_id", default: 0, null: false, comment: "Linked Product ID", unsigned: true
    t.integer "link_type_id", limit: 2, default: 0, null: false, comment: "Link Type ID", unsigned: true
    t.index ["link_type_id", "product_id", "linked_product_id"], name: "CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID", unique: true
    t.index ["linked_product_id"], name: "CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID"
    t.index ["product_id"], name: "CATALOG_PRODUCT_LINK_PRODUCT_ID"
  end

  create_table "catalog_product_link_attribute", primary_key: "product_link_attribute_id", id: { type: :integer, limit: 2, comment: "Product Link Attribute ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Link Attribute Table", force: :cascade do |t|
    t.integer "link_type_id", limit: 2, default: 0, null: false, comment: "Link Type ID", unsigned: true
    t.string "product_link_attribute_code", limit: 32, comment: "Product Link Attribute Code"
    t.string "data_type", limit: 32, comment: "Data Type"
    t.index ["link_type_id"], name: "CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID"
  end

  create_table "catalog_product_link_attribute_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Link Decimal Attribute Table", force: :cascade do |t|
    t.integer "product_link_attribute_id", limit: 2, comment: "Product Link Attribute ID", unsigned: true
    t.integer "link_id", null: false, comment: "Link ID", unsigned: true
    t.decimal "value", precision: 20, scale: 6, default: "0.0", null: false, comment: "Value"
    t.index ["link_id"], name: "CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID"
    t.index ["product_link_attribute_id", "link_id"], name: "CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID", unique: true
  end

  create_table "catalog_product_link_attribute_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Link Integer Attribute Table", force: :cascade do |t|
    t.integer "product_link_attribute_id", limit: 2, comment: "Product Link Attribute ID", unsigned: true
    t.integer "link_id", null: false, comment: "Link ID", unsigned: true
    t.integer "value", default: 0, null: false, comment: "Value"
    t.index ["link_id"], name: "CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID"
    t.index ["product_link_attribute_id", "link_id"], name: "CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID", unique: true
  end

  create_table "catalog_product_link_attribute_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Link Varchar Attribute Table", force: :cascade do |t|
    t.integer "product_link_attribute_id", limit: 2, default: 0, null: false, comment: "Product Link Attribute ID", unsigned: true
    t.integer "link_id", null: false, comment: "Link ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["link_id"], name: "CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID"
    t.index ["product_link_attribute_id", "link_id"], name: "CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID", unique: true
  end

  create_table "catalog_product_link_type", primary_key: "link_type_id", id: { type: :integer, limit: 2, comment: "Link Type ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Link Type Table", force: :cascade do |t|
    t.string "code", limit: 32, comment: "Code"
  end

  create_table "catalog_product_option", primary_key: "option_id", id: { type: :integer, comment: "Option ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.string "type", limit: 50, comment: "Type"
    t.integer "is_require", limit: 2, default: 1, null: false, comment: "Is Required"
    t.string "sku", limit: 64, comment: "SKU"
    t.integer "max_characters", comment: "Max Characters", unsigned: true
    t.string "file_extension", limit: 50, comment: "File Extension"
    t.integer "image_size_x", limit: 2, comment: "Image Size X", unsigned: true
    t.integer "image_size_y", limit: 2, comment: "Image Size Y", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["product_id"], name: "CATALOG_PRODUCT_OPTION_PRODUCT_ID"
  end

  create_table "catalog_product_option_price", primary_key: "option_price_id", id: { type: :integer, comment: "Option Price ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Price Table", force: :cascade do |t|
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Price"
    t.string "price_type", limit: 7, default: "fixed", null: false, comment: "Price Type"
    t.index ["option_id", "store_id"], name: "CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_OPTION_PRICE_STORE_ID"
  end

  create_table "catalog_product_option_title", primary_key: "option_title_id", id: { type: :integer, comment: "Option Title ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Title Table", force: :cascade do |t|
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "title", comment: "Title"
    t.index ["option_id", "store_id"], name: "CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_OPTION_TITLE_STORE_ID"
  end

  create_table "catalog_product_option_type_price", primary_key: "option_type_price_id", id: { type: :integer, comment: "Option Type Price ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Type Price Table", force: :cascade do |t|
    t.integer "option_type_id", default: 0, null: false, comment: "Option Type ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Price"
    t.string "price_type", limit: 7, default: "fixed", null: false, comment: "Price Type"
    t.index ["option_type_id", "store_id"], name: "CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID"
  end

  create_table "catalog_product_option_type_title", primary_key: "option_type_title_id", id: { type: :integer, comment: "Option Type Title ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Type Title Table", force: :cascade do |t|
    t.integer "option_type_id", default: 0, null: false, comment: "Option Type ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "title", comment: "Title"
    t.index ["option_type_id", "store_id"], name: "CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID"
  end

  create_table "catalog_product_option_type_value", primary_key: "option_type_id", id: { type: :integer, comment: "Option Type ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Option Type Value Table", force: :cascade do |t|
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.string "sku", limit: 64, comment: "SKU"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["option_id"], name: "CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID"
  end

  create_table "catalog_product_relation", primary_key: ["parent_id", "child_id"], charset: "utf8", comment: "Catalog Product Relation Table", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "child_id", null: false, comment: "Child ID", unsigned: true
    t.index ["child_id"], name: "CATALOG_PRODUCT_RELATION_CHILD_ID"
  end

  create_table "catalog_product_super_attribute", primary_key: "product_super_attribute_id", id: { type: :integer, comment: "Product Super Attribute ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Super Attribute Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position", unsigned: true
    t.index ["product_id", "attribute_id"], name: "CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "catalog_product_super_attribute_label", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Super Attribute Label Table", force: :cascade do |t|
    t.integer "product_super_attribute_id", default: 0, null: false, comment: "Product Super Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "use_default", limit: 2, default: 0, comment: "Use Default Value", unsigned: true
    t.string "value", comment: "Value"
    t.index ["product_super_attribute_id", "store_id"], name: "CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID"
  end

  create_table "catalog_product_super_link", primary_key: "link_id", id: { type: :integer, comment: "Link ID", unsigned: true }, charset: "utf8", comment: "Catalog Product Super Link Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "parent_id", default: 0, null: false, comment: "Parent ID", unsigned: true
    t.index ["parent_id"], name: "CATALOG_PRODUCT_SUPER_LINK_PARENT_ID"
    t.index ["product_id", "parent_id"], name: "CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID", unique: true
  end

  create_table "catalog_product_website", primary_key: ["product_id", "website_id"], charset: "utf8", comment: "Catalog Product To Website Linkage Table", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.index ["website_id"], name: "CATALOG_PRODUCT_WEBSITE_WEBSITE_ID"
  end

  create_table "catalog_url_rewrite_product_category", id: false, charset: "utf8", comment: "url_rewrite_relation", force: :cascade do |t|
    t.integer "url_rewrite_id", null: false, comment: "url_rewrite_id", unsigned: true
    t.integer "category_id", null: false, comment: "category_id", unsigned: true
    t.integer "product_id", null: false, comment: "product_id", unsigned: true
    t.index ["category_id", "product_id"], name: "CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID"
    t.index ["product_id"], name: "CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID"
    t.index ["url_rewrite_id"], name: "FK_BB79E64705D7F17FE181F23144528FC8"
  end

  create_table "cataloginventory_stock", primary_key: "stock_id", id: { type: :integer, limit: 2, comment: "Stock ID", unsigned: true }, charset: "utf8", comment: "Cataloginventory Stock", force: :cascade do |t|
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.string "stock_name", comment: "Stock Name"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_WEBSITE_ID"
  end

  create_table "cataloginventory_stock_item", primary_key: "item_id", id: { type: :integer, comment: "Item ID", unsigned: true }, charset: "utf8", comment: "Cataloginventory Stock Item", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "stock_id", limit: 2, default: 0, null: false, comment: "Stock ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, comment: "Qty"
    t.decimal "min_qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Min Qty"
    t.integer "use_config_min_qty", limit: 2, default: 1, null: false, comment: "Use Config Min Qty", unsigned: true
    t.integer "is_qty_decimal", limit: 2, default: 0, null: false, comment: "Is Qty Decimal", unsigned: true
    t.integer "backorders", limit: 2, default: 0, null: false, comment: "Backorders", unsigned: true
    t.integer "use_config_backorders", limit: 2, default: 1, null: false, comment: "Use Config Backorders", unsigned: true
    t.decimal "min_sale_qty", precision: 12, scale: 4, default: "1.0", null: false, comment: "Min Sale Qty"
    t.integer "use_config_min_sale_qty", limit: 2, default: 1, null: false, comment: "Use Config Min Sale Qty", unsigned: true
    t.decimal "max_sale_qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Max Sale Qty"
    t.integer "use_config_max_sale_qty", limit: 2, default: 1, null: false, comment: "Use Config Max Sale Qty", unsigned: true
    t.integer "is_in_stock", limit: 2, default: 0, null: false, comment: "Is In Stock", unsigned: true
    t.timestamp "low_stock_date", comment: "Low Stock Date"
    t.decimal "notify_stock_qty", precision: 12, scale: 4, comment: "Notify Stock Qty"
    t.integer "use_config_notify_stock_qty", limit: 2, default: 1, null: false, comment: "Use Config Notify Stock Qty", unsigned: true
    t.integer "manage_stock", limit: 2, default: 0, null: false, comment: "Manage Stock", unsigned: true
    t.integer "use_config_manage_stock", limit: 2, default: 1, null: false, comment: "Use Config Manage Stock", unsigned: true
    t.integer "stock_status_changed_auto", limit: 2, default: 0, null: false, comment: "Stock Status Changed Automatically", unsigned: true
    t.integer "use_config_qty_increments", limit: 2, default: 1, null: false, comment: "Use Config Qty Increments", unsigned: true
    t.decimal "qty_increments", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty Increments"
    t.integer "use_config_enable_qty_inc", limit: 2, default: 1, null: false, comment: "Use Config Enable Qty Increments", unsigned: true
    t.integer "enable_qty_increments", limit: 2, default: 0, null: false, comment: "Enable Qty Increments", unsigned: true
    t.integer "is_decimal_divided", limit: 2, default: 0, null: false, comment: "Is Divided into Multiple Boxes for Shipping", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.index ["product_id", "stock_id"], name: "CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID", unique: true
    t.index ["stock_id"], name: "CATALOGINVENTORY_STOCK_ITEM_STOCK_ID"
    t.index ["website_id", "product_id"], name: "CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID"
  end

  create_table "cataloginventory_stock_status", primary_key: ["product_id", "website_id", "stock_id"], charset: "utf8", comment: "Cataloginventory Stock Status", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "stock_id", limit: 2, null: false, comment: "Stock ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.integer "stock_status", limit: 2, null: false, comment: "Stock Status", unsigned: true
    t.index ["stock_id"], name: "CATALOGINVENTORY_STOCK_STATUS_STOCK_ID"
    t.index ["stock_status"], name: "CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID"
  end

  create_table "cataloginventory_stock_status_idx", primary_key: ["product_id", "website_id", "stock_id"], charset: "utf8", comment: "Cataloginventory Stock Status Indexer Idx", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "stock_id", limit: 2, null: false, comment: "Stock ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.integer "stock_status", limit: 2, null: false, comment: "Stock Status", unsigned: true
    t.index ["stock_id"], name: "CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID"
  end

  create_table "cataloginventory_stock_status_replica", primary_key: ["product_id", "website_id", "stock_id"], charset: "utf8", comment: "Cataloginventory Stock Status", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "stock_id", limit: 2, null: false, comment: "Stock ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.integer "stock_status", limit: 2, null: false, comment: "Stock Status", unsigned: true
    t.index ["stock_id"], name: "CATALOGINVENTORY_STOCK_STATUS_STOCK_ID"
    t.index ["stock_status"], name: "CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID"
  end

  create_table "cataloginventory_stock_status_tmp", primary_key: ["product_id", "website_id", "stock_id"], charset: "utf8", comment: "Cataloginventory Stock Status Indexer Tmp", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "stock_id", limit: 2, null: false, comment: "Stock ID", unsigned: true
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.integer "stock_status", limit: 2, null: false, comment: "Stock Status", unsigned: true
    t.index ["stock_id"], name: "CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID"
    t.index ["website_id"], name: "CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID"
  end

  create_table "catalogrule", primary_key: "rule_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "CatalogRule", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.text "description", comment: "Description"
    t.date "from_date", comment: "From"
    t.date "to_date", comment: "To"
    t.integer "is_active", limit: 2, default: 0, null: false, comment: "Is Active"
    t.text "conditions_serialized", size: :medium, comment: "Conditions Serialized"
    t.text "actions_serialized", size: :medium, comment: "Actions Serialized"
    t.integer "stop_rules_processing", limit: 2, default: 1, null: false, comment: "Stop Rules Processing"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.string "simple_action", limit: 32, comment: "Simple Action"
    t.decimal "discount_amount", precision: 20, scale: 6, default: "0.0", null: false, comment: "Discount Amount"
    t.index ["is_active", "sort_order", "to_date", "from_date"], name: "CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE"
  end

  create_table "catalogrule_customer_group", primary_key: ["rule_id", "customer_group_id"], charset: "utf8", comment: "Catalog Rules To Customer Groups Relations", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.index ["customer_group_id"], name: "CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID"
  end

  create_table "catalogrule_group_website", primary_key: ["rule_id", "customer_group_id", "website_id"], charset: "utf8", comment: "CatalogRule Group Website", force: :cascade do |t|
    t.integer "rule_id", default: 0, null: false, comment: "Rule ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.index ["customer_group_id"], name: "CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID"
    t.index ["website_id"], name: "CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID"
  end

  create_table "catalogrule_group_website_replica", primary_key: ["rule_id", "customer_group_id", "website_id"], charset: "utf8", comment: "CatalogRule Group Website", force: :cascade do |t|
    t.integer "rule_id", default: 0, null: false, comment: "Rule ID", unsigned: true
    t.integer "customer_group_id", default: 0, null: false, comment: "Customer Group ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.index ["customer_group_id"], name: "CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID"
    t.index ["website_id"], name: "CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID"
  end

  create_table "catalogrule_product", primary_key: "rule_product_id", id: { type: :integer, comment: "Rule Product ID", unsigned: true }, charset: "utf8", comment: "CatalogRule Product", force: :cascade do |t|
    t.integer "rule_id", default: 0, null: false, comment: "Rule ID", unsigned: true
    t.integer "from_time", default: 0, null: false, comment: "From Time", unsigned: true
    t.integer "to_time", default: 0, null: false, comment: "To time", unsigned: true
    t.integer "customer_group_id"
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.string "action_operator", limit: 10, default: "to_fixed", comment: "Action Operator"
    t.decimal "action_amount", precision: 20, scale: 6, default: "0.0", null: false, comment: "Action Amount"
    t.integer "action_stop", limit: 2, default: 0, null: false, comment: "Action Stop"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.index ["customer_group_id"], name: "CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID"
    t.index ["from_time"], name: "CATALOGRULE_PRODUCT_FROM_TIME"
    t.index ["product_id"], name: "CATALOGRULE_PRODUCT_PRODUCT_ID"
    t.index ["rule_id", "from_time", "to_time", "website_id", "customer_group_id", "product_id", "sort_order"], name: "UNQ_EAA51B56FF092A0DCB795D1CEF812B7B", unique: true
    t.index ["to_time"], name: "CATALOGRULE_PRODUCT_TO_TIME"
    t.index ["website_id"], name: "CATALOGRULE_PRODUCT_WEBSITE_ID"
  end

  create_table "catalogrule_product_price", primary_key: "rule_product_price_id", id: { type: :integer, comment: "Rule Product PriceId", unsigned: true }, charset: "utf8", comment: "CatalogRule Product Price", force: :cascade do |t|
    t.date "rule_date", null: false, comment: "Rule Date"
    t.integer "customer_group_id"
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.decimal "rule_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Rule Price"
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.date "latest_start_date", comment: "Latest StartDate"
    t.date "earliest_end_date", comment: "Earliest EndDate"
    t.index ["customer_group_id"], name: "CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID"
    t.index ["product_id"], name: "CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID"
    t.index ["rule_date", "website_id", "customer_group_id", "product_id"], name: "CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID", unique: true
    t.index ["website_id"], name: "CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID"
  end

  create_table "catalogrule_product_price_replica", primary_key: "rule_product_price_id", id: { type: :integer, comment: "Rule Product PriceId", unsigned: true }, charset: "utf8", comment: "CatalogRule Product Price", force: :cascade do |t|
    t.date "rule_date", null: false, comment: "Rule Date"
    t.integer "customer_group_id"
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.decimal "rule_price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Rule Price"
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.date "latest_start_date", comment: "Latest StartDate"
    t.date "earliest_end_date", comment: "Earliest EndDate"
    t.index ["customer_group_id"], name: "CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID"
    t.index ["product_id"], name: "CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID"
    t.index ["rule_date", "website_id", "customer_group_id", "product_id"], name: "CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID", unique: true
    t.index ["website_id"], name: "CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID"
  end

  create_table "catalogrule_product_replica", primary_key: "rule_product_id", id: { type: :integer, comment: "Rule Product ID", unsigned: true }, charset: "utf8", comment: "CatalogRule Product", force: :cascade do |t|
    t.integer "rule_id", default: 0, null: false, comment: "Rule ID", unsigned: true
    t.integer "from_time", default: 0, null: false, comment: "From Time", unsigned: true
    t.integer "to_time", default: 0, null: false, comment: "To time", unsigned: true
    t.integer "customer_group_id"
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.string "action_operator", limit: 10, default: "to_fixed", comment: "Action Operator"
    t.decimal "action_amount", precision: 20, scale: 6, default: "0.0", null: false, comment: "Action Amount"
    t.integer "action_stop", limit: 2, default: 0, null: false, comment: "Action Stop"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.index ["customer_group_id"], name: "CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID"
    t.index ["from_time"], name: "CATALOGRULE_PRODUCT_FROM_TIME"
    t.index ["product_id"], name: "CATALOGRULE_PRODUCT_PRODUCT_ID"
    t.index ["rule_id", "from_time", "to_time", "website_id", "customer_group_id", "product_id", "sort_order"], name: "UNQ_EAA51B56FF092A0DCB795D1CEF812B7B", unique: true
    t.index ["to_time"], name: "CATALOGRULE_PRODUCT_TO_TIME"
    t.index ["website_id"], name: "CATALOGRULE_PRODUCT_WEBSITE_ID"
  end

  create_table "catalogrule_website", primary_key: ["rule_id", "website_id"], charset: "utf8", comment: "Catalog Rules To Websites Relations", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.index ["website_id"], name: "CATALOGRULE_WEBSITE_WEBSITE_ID"
  end

  create_table "catalogsearch_fulltext_scope1", primary_key: ["entity_id", "attribute_id"], charset: "utf8", comment: "catalogsearch_fulltext_scope1_tmp", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", null: false, comment: "Attribute_id", unsigned: true
    t.text "data_index", size: :long, comment: "Data index"
    t.index ["data_index"], name: "FTI_FULLTEXT_DATA_INDEX", type: :fulltext
  end

  create_table "catalogsearch_fulltext_scope2", primary_key: ["entity_id", "attribute_id"], charset: "utf8", comment: "catalogsearch_fulltext_scope2_tmp", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.integer "attribute_id", null: false, comment: "Attribute_id", unsigned: true
    t.text "data_index", size: :long, comment: "Data index"
    t.index ["data_index"], name: "FTI_FULLTEXT_DATA_INDEX", type: :fulltext
  end

  create_table "catalogsearch_recommendations", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Advanced Search Recommendations", force: :cascade do |t|
    t.integer "query_id", default: 0, null: false, comment: "Query ID", unsigned: true
    t.integer "relation_id", default: 0, null: false, comment: "Relation ID", unsigned: true
    t.index ["query_id"], name: "CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID"
    t.index ["relation_id"], name: "CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID"
  end

  create_table "checkout_agreement", primary_key: "agreement_id", id: { type: :integer, comment: "Agreement ID", unsigned: true }, charset: "utf8", comment: "Checkout Agreement", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.text "content", comment: "Content"
    t.string "content_height", limit: 25, comment: "Content Height"
    t.text "checkbox_text", comment: "Checkbox Text"
    t.integer "is_active", limit: 2, default: 0, null: false, comment: "Is Active"
    t.integer "is_html", limit: 2, default: 0, null: false, comment: "Is Html"
    t.integer "mode", limit: 2, default: 0, null: false, comment: "Applied mode"
  end

  create_table "checkout_agreement_store", primary_key: ["agreement_id", "store_id"], charset: "utf8", comment: "Checkout Agreement Store", force: :cascade do |t|
    t.integer "agreement_id", null: false, comment: "Agreement ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID"
  end

  create_table "cms_block", primary_key: "block_id", id: { type: :integer, limit: 2, comment: "Entity ID" }, charset: "utf8", comment: "CMS Block Table", force: :cascade do |t|
    t.string "title", null: false, comment: "Block Title"
    t.string "identifier", null: false, comment: "Block String Identifier"
    t.text "content", size: :medium, comment: "Block Content"
    t.timestamp "creation_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Block Creation Time"
    t.timestamp "update_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Block Modification Time"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Block Active"
    t.index ["title", "identifier", "content"], name: "CMS_BLOCK_TITLE_IDENTIFIER_CONTENT", type: :fulltext
  end

  create_table "cms_block_store", primary_key: ["block_id", "store_id"], charset: "utf8", comment: "CMS Block To Store Linkage Table", force: :cascade do |t|
    t.integer "block_id", limit: 2, null: false
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "CMS_BLOCK_STORE_STORE_ID"
  end

  create_table "cms_page", primary_key: "page_id", id: { type: :integer, limit: 2, comment: "Entity ID" }, charset: "utf8", comment: "CMS Page Table", force: :cascade do |t|
    t.string "title", comment: "Page Title"
    t.string "page_layout", comment: "Page Layout"
    t.text "meta_keywords", comment: "Page Meta Keywords"
    t.text "meta_description", comment: "Page Meta Description"
    t.string "identifier", limit: 100, comment: "Page String Identifier"
    t.string "content_heading", comment: "Page Content Heading"
    t.text "content", size: :medium, comment: "Page Content"
    t.timestamp "creation_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Page Creation Time"
    t.timestamp "update_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Page Modification Time"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Page Active"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Page Sort Order"
    t.text "layout_update_xml", comment: "Page Layout Update Content"
    t.string "custom_theme", limit: 100, comment: "Page Custom Theme"
    t.string "custom_root_template", comment: "Page Custom Template"
    t.text "custom_layout_update_xml", comment: "Page Custom Layout Update Content"
    t.string "layout_update_selected", limit: 128, comment: "Page Custom Layout File"
    t.date "custom_theme_from", comment: "Page Custom Theme Active From Date"
    t.date "custom_theme_to", comment: "Page Custom Theme Active To Date"
    t.string "meta_title", comment: "Page Meta Title"
    t.index ["identifier"], name: "CMS_PAGE_IDENTIFIER"
    t.index ["title", "meta_keywords", "meta_description", "identifier", "content"], name: "CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT", type: :fulltext
  end

  create_table "cms_page_store", primary_key: ["page_id", "store_id"], charset: "utf8", comment: "CMS Page To Store Linkage Table", force: :cascade do |t|
    t.integer "page_id", limit: 2, null: false, comment: "Entity ID"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "CMS_PAGE_STORE_STORE_ID"
  end

  create_table "commerce9_brands", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Product Brands", force: :cascade do |t|
    t.string "brand_attr_value", null: false, comment: "product attribute value"
    t.string "brand_attr_label", comment: "product attribute label"
    t.string "brand_title", null: false, comment: "Brand Title"
    t.text "brand_description", comment: "Brand Description"
    t.integer "include_in_menu", limit: 2, default: 0, null: false, comment: "Brand - include in menu", unsigned: true
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
    t.string "brand_url_key", null: false, comment: "Brand Url Key"
    t.string "brand_image", comment: "Brand Image"
    t.string "brand_logo", comment: "Brand Logo"
    t.text "meta_key", comment: "Meta key"
    t.text "meta_description", comment: "Meta Description"
    t.integer "is_featured_brand", limit: 2, default: 0, null: false, comment: "Is Featured", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "commerce9_sellerprofile_documents", primary_key: "documents_id", id: { type: :integer, comment: "Documents Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_documents Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.string "document_name", comment: "Document Name"
    t.string "saved_path", comment: "Saved Path"
    t.integer "verifystatus", limit: 2, default: 0, null: false, comment: "Verify Status", unsigned: true
    t.string "verifycomments", comment: "Verify Comments"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_DOCUMENTS_SELLER_ID"
  end

  create_table "commerce9_sellerprofile_seller_bank_details", primary_key: "seller_bank_details_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_seller_bank_details Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.text "beneficiary_name", comment: "Beneficiary Name"
    t.string "beneficiary_address", comment: "Beneficiary Address"
    t.text "bank_name", comment: "Bank Name"
    t.text "branch_name", comment: "Branch Name"
    t.text "bank_country", comment: "Bank Country"
    t.string "bank_city", comment: "Bank City"
    t.string "account_number", comment: "Account Number"
    t.string "iban_number", comment: "IBAN Number"
    t.string "swift_code", comment: "Swift Code"
    t.string "sortcode_aba_ifsc", comment: "Sort Code/ABA No/IFSC No"
    t.string "preferred_currency", comment: "Preferred Currency"
    t.string "status", comment: "Status"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_SELLER_BANK_DETAILS_SELLER_ID"
  end

  create_table "commerce9_sellerprofile_seller_commercials", primary_key: "seller_commercials_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_seller_commercials Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.string "business_type", comment: "Business Type"
    t.string "incoterms", comment: "Incoterms"
    t.string "cost_price_structure", comment: "Cost Price Structure"
    t.string "discount_from_rrp", comment: "Discount From RRP"
    t.string "selling_price_fee", comment: "Selling Price Fee"
    t.string "category", comment: "Category"
    t.string "commission_fee", comment: "Commission Fee"
    t.string "payment_terms", comment: "Payment Terms"
    t.string "deposit", comment: "Deposit"
    t.string "amount", comment: "Amount"
    t.string "currency", comment: "Currency"
    t.string "billing_cycle", comment: "Billing Cycle"
    t.text "comments", comment: "Comments"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_SELLER_COMMERCIALS_SELLER_ID"
  end

  create_table "commerce9_sellerprofile_seller_operations", primary_key: "seller_operations_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_seller_operations Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.text "warehouse_location", comment: "Warehouse Location"
    t.text "city", comment: "City"
    t.text "country", comment: "Country"
    t.string "warehouse_contact_person", comment: "Warehouse Contact Person"
    t.string "email_address_operations", comment: "Email Address"
    t.string "phone_number", comment: "Phone Number"
    t.string "returns_accepted", comment: "Returns Accepted"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_SELLER_OPERATIONS_SELLER_ID"
  end

  create_table "commerce9_sellerprofile_seller_profile", primary_key: "seller_profile_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_seller_profile Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.text "profile_name", comment: "Profile Name"
    t.string "location", comment: "Location of Seller"
    t.string "pre_scales_cs_phone_number", comment: "pre_scales_cs_phone_number"
    t.string "email_address", comment: "Email Address"
    t.string "profile_image", comment: "Profile Image"
    t.string "banner_image", comment: "Banner Image"
    t.string "store_speciality", comment: "Store Speciality"
    t.text "bio", comment: "Bio"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_SELLER_PROFILE_SELLER_ID"
  end

  create_table "commerce9_sellerprofile_supplier_details", primary_key: "supplier_details_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "commerce9_sellerprofile_supplier_details Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.text "registered_company_name", comment: "Registered Company Name"
    t.string "trading_licence_number", comment: "Trading Licence Number"
    t.date "trading_license_expiry_date", comment: "Trading License Expiry Date"
    t.string "contact_person", comment: "Contact Person"
    t.string "email_address_supplier", comment: "Email Address"
    t.string "contact_number", comment: "Contact Number"
    t.string "status_supplier", comment: "Status"
    t.index ["seller_id"], name: "COMMERCE9_SELLERPROFILE_SUPPLIER_DETAILS_SELLER_ID"
  end

  create_table "core_config_data", primary_key: "config_id", id: { type: :integer, comment: "Config ID", unsigned: true }, charset: "utf8", comment: "Config Data", force: :cascade do |t|
    t.string "scope", limit: 8, default: "default", null: false, comment: "Config Scope"
    t.integer "scope_id", default: 0, null: false, comment: "Config Scope ID"
    t.string "path", default: "general", null: false, comment: "Config Path"
    t.text "value", comment: "Config Value"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.index ["scope", "scope_id", "path"], name: "CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH", unique: true
  end

  create_table "cron_schedule", primary_key: "schedule_id", id: { type: :integer, comment: "Schedule ID", unsigned: true }, charset: "utf8", comment: "Cron Schedule", force: :cascade do |t|
    t.string "job_code", default: "0", null: false, comment: "Job Code"
    t.string "status", limit: 7, default: "pending", null: false, comment: "Status"
    t.text "messages", comment: "Messages"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "scheduled_at", comment: "Scheduled At"
    t.timestamp "executed_at", comment: "Executed At"
    t.timestamp "finished_at", comment: "Finished At"
    t.index ["job_code"], name: "CRON_SCHEDULE_JOB_CODE"
    t.index ["scheduled_at", "status"], name: "CRON_SCHEDULE_SCHEDULED_AT_STATUS"
  end

  create_table "customer_address_entity", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Customer Address Entity", force: :cascade do |t|
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.integer "parent_id", comment: "Parent ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Active", unsigned: true
    t.string "city", null: false, comment: "City"
    t.string "company", comment: "Company"
    t.string "country_id", null: false, comment: "Country"
    t.string "fax", comment: "Fax"
    t.string "firstname", null: false, comment: "First Name"
    t.string "lastname", null: false, comment: "Last Name"
    t.string "middlename", comment: "Middle Name"
    t.string "postcode", comment: "Zip/Postal Code"
    t.string "prefix", limit: 40, comment: "Name Prefix"
    t.string "region", comment: "State/Province"
    t.integer "region_id", comment: "State/Province", unsigned: true
    t.text "street", null: false, comment: "Street Address"
    t.string "suffix", limit: 40, comment: "Name Suffix"
    t.string "telephone", null: false, comment: "Phone Number"
    t.string "vat_id", comment: "VAT number"
    t.integer "vat_is_valid", comment: "VAT number validity", unsigned: true
    t.string "vat_request_date", comment: "VAT number validation request date"
    t.string "vat_request_id", comment: "VAT number validation request ID"
    t.integer "vat_request_success", comment: "VAT number validation request success", unsigned: true
    t.index ["parent_id"], name: "CUSTOMER_ADDRESS_ENTITY_PARENT_ID"
  end

  create_table "customer_address_entity_datetime", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Address Entity Datetime", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.datetime "value", comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_address_entity_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Address Entity Decimal", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_address_entity_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Address Entity Int", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "value", default: 0, null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_address_entity_text", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Address Entity Text", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.text "value", null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_address_entity_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Address Entity Varchar", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_eav_attribute", primary_key: "attribute_id", id: { type: :integer, limit: 2, comment: "Attribute ID", unsigned: true, default: nil }, charset: "utf8", comment: "Customer Eav Attribute", force: :cascade do |t|
    t.integer "is_visible", limit: 2, default: 1, null: false, comment: "Is Visible", unsigned: true
    t.string "input_filter", comment: "Input Filter"
    t.integer "multiline_count", limit: 2, default: 1, null: false, comment: "Multiline Count", unsigned: true
    t.text "validate_rules", comment: "Validate Rules"
    t.integer "is_system", limit: 2, default: 0, null: false, comment: "Is System", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.string "data_model", comment: "Data Model"
    t.integer "is_used_in_grid", limit: 2, default: 0, null: false, comment: "Is Used in Grid", unsigned: true
    t.integer "is_visible_in_grid", limit: 2, default: 0, null: false, comment: "Is Visible in Grid", unsigned: true
    t.integer "is_filterable_in_grid", limit: 2, default: 0, null: false, comment: "Is Filterable in Grid", unsigned: true
    t.integer "is_searchable_in_grid", limit: 2, default: 0, null: false, comment: "Is Searchable in Grid", unsigned: true
    t.index ["sort_order"], name: "CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER"
  end

  create_table "customer_eav_attribute_website", primary_key: ["attribute_id", "website_id"], charset: "utf8", comment: "Customer Eav Attribute Website", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "is_visible", limit: 2, comment: "Is Visible", unsigned: true
    t.integer "is_required", limit: 2, comment: "Is Required", unsigned: true
    t.text "default_value", comment: "Default Value"
    t.integer "multiline_count", limit: 2, comment: "Multiline Count", unsigned: true
    t.index ["website_id"], name: "CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID"
  end

  create_table "customer_entity", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Customer Entity", force: :cascade do |t|
    t.integer "website_id", limit: 2, comment: "Website ID", unsigned: true
    t.string "email", comment: "Email"
    t.integer "group_id", limit: 2, default: 0, null: false, comment: "Group ID", unsigned: true
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.integer "store_id", limit: 2, default: 0, comment: "Store ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Active", unsigned: true
    t.integer "disable_auto_group_change", limit: 2, default: 0, null: false, comment: "Disable automatic group change based on VAT ID", unsigned: true
    t.string "created_in", comment: "Created From"
    t.string "prefix", limit: 40, comment: "Name Prefix"
    t.string "firstname", comment: "First Name"
    t.string "middlename", comment: "Middle Name/Initial"
    t.string "lastname", comment: "Last Name"
    t.string "suffix", limit: 40, comment: "Name Suffix"
    t.date "dob", comment: "Date of Birth"
    t.string "password_hash", limit: 128, comment: "Password_hash"
    t.string "rp_token", limit: 128, comment: "Reset password token"
    t.datetime "rp_token_created_at", comment: "Reset password token creation time"
    t.integer "default_billing", comment: "Default Billing Address", unsigned: true
    t.integer "default_shipping", comment: "Default Shipping Address", unsigned: true
    t.string "taxvat", limit: 50, comment: "Tax/VAT Number"
    t.string "confirmation", limit: 64, comment: "Is Confirmed"
    t.integer "gender", limit: 2, comment: "Gender", unsigned: true
    t.integer "failures_num", limit: 2, default: 0, comment: "Failure Number"
    t.timestamp "first_failure", comment: "First Failure"
    t.timestamp "lock_expires", comment: "Lock Expiration Date"
    t.text "bio"
    t.string "website"
    t.text "about"
    t.string "provider"
    t.text "provider_token"
    t.integer "mp_smtp_email_marketing_synced", limit: 2, default: 0, comment: "Mp SMTP Email Marketing synced"
    t.index ["email", "website_id"], name: "CUSTOMER_ENTITY_EMAIL_WEBSITE_ID", unique: true
    t.index ["firstname"], name: "CUSTOMER_ENTITY_FIRSTNAME"
    t.index ["lastname"], name: "CUSTOMER_ENTITY_LASTNAME"
    t.index ["store_id"], name: "CUSTOMER_ENTITY_STORE_ID"
    t.index ["website_id"], name: "CUSTOMER_ENTITY_WEBSITE_ID"
  end

  create_table "customer_entity_datetime", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Entity Datetime", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.datetime "value", comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_entity_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Entity Decimal", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_entity_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Entity Int", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "value", default: 0, null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ENTITY_INT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_entity_text", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Entity Text", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.text "value", null: false, comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_entity_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Customer Entity Varchar", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["attribute_id"], name: "CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "value"], name: "CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id"], name: "CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "customer_form_attribute", primary_key: ["form_code", "attribute_id"], charset: "utf8", comment: "Customer Form Attribute", force: :cascade do |t|
    t.string "form_code", limit: 32, null: false, comment: "Form Code"
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.index ["attribute_id"], name: "CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID"
  end

  create_table "customer_grid_flat", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "customer_grid_flat", force: :cascade do |t|
    t.text "name", comment: "Name"
    t.string "email", comment: "Email"
    t.integer "group_id", comment: "Group_id"
    t.timestamp "created_at", comment: "Created_at"
    t.integer "website_id", comment: "Website_id"
    t.string "confirmation", comment: "Confirmation"
    t.text "created_in", comment: "Created_in"
    t.date "dob", comment: "Dob"
    t.integer "gender", comment: "Gender"
    t.string "taxvat", comment: "Taxvat"
    t.timestamp "lock_expires", comment: "Lock_expires"
    t.string "profile_picture", comment: "Profile_picture"
    t.text "shipping_full", comment: "Shipping_full"
    t.text "billing_full", comment: "Billing_full"
    t.string "billing_firstname", comment: "Billing_firstname"
    t.string "billing_lastname", comment: "Billing_lastname"
    t.string "billing_telephone", comment: "Billing_telephone"
    t.string "billing_postcode", comment: "Billing_postcode"
    t.string "billing_country_id", comment: "Billing_country_id"
    t.string "billing_region", comment: "Billing_region"
    t.integer "billing_region_id", comment: "Billing_region_id"
    t.string "billing_street", comment: "Billing_street"
    t.string "billing_city", comment: "Billing_city"
    t.string "billing_fax", comment: "Billing_fax"
    t.string "billing_vat_id", comment: "Billing_vat_id"
    t.string "billing_company", comment: "Billing_company"
    t.index ["billing_country_id"], name: "CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID"
    t.index ["confirmation"], name: "CUSTOMER_GRID_FLAT_CONFIRMATION"
    t.index ["created_at"], name: "CUSTOMER_GRID_FLAT_CREATED_AT"
    t.index ["dob"], name: "CUSTOMER_GRID_FLAT_DOB"
    t.index ["gender"], name: "CUSTOMER_GRID_FLAT_GENDER"
    t.index ["group_id"], name: "CUSTOMER_GRID_FLAT_GROUP_ID"
    t.index ["name", "email", "created_in", "taxvat", "shipping_full", "billing_full", "billing_firstname", "billing_lastname", "billing_telephone", "billing_postcode", "billing_region", "billing_city", "billing_fax", "billing_company"], name: "FTI_8746F705702DD5F6D45B8C7CE7FE9F2F", type: :fulltext
    t.index ["website_id"], name: "CUSTOMER_GRID_FLAT_WEBSITE_ID"
  end

  create_table "customer_group", primary_key: "customer_group_id", id: { type: :integer, unsigned: true }, charset: "utf8", comment: "Customer Group", force: :cascade do |t|
    t.string "customer_group_code", limit: 32, null: false, comment: "Customer Group Code"
    t.integer "tax_class_id", default: 0, null: false, comment: "Tax Class ID", unsigned: true
  end

  create_table "customer_log", primary_key: "log_id", id: { type: :integer, comment: "Log ID" }, charset: "utf8", comment: "Customer Log Table", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer ID"
    t.timestamp "last_login_at", comment: "Last Login Time"
    t.timestamp "last_logout_at", comment: "Last Logout Time"
    t.index ["customer_id"], name: "CUSTOMER_LOG_CUSTOMER_ID", unique: true
  end

  create_table "customer_visitor", primary_key: "visitor_id", id: { type: :bigint, comment: "Visitor ID", unsigned: true }, charset: "utf8", comment: "Visitor Table", force: :cascade do |t|
    t.integer "customer_id", comment: "Customer ID"
    t.string "session_id", limit: 64, comment: "Session ID"
    t.timestamp "last_visit_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Last Visit Time"
    t.index ["customer_id"], name: "CUSTOMER_VISITOR_CUSTOMER_ID"
    t.index ["last_visit_at"], name: "CUSTOMER_VISITOR_LAST_VISIT_AT"
  end

  create_table "delayed_jobs", charset: "latin1", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "deleted_products", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Deleted Products details", force: :cascade do |t|
    t.string "product_id", null: false
    t.string "sku"
    t.timestamp "deleted_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
  end

  create_table "design_change", primary_key: "design_change_id", id: { type: :integer, comment: "Design Change ID" }, charset: "utf8", comment: "Design Changes", force: :cascade do |t|
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "design", comment: "Design"
    t.date "date_from", comment: "First Date of Design Activity"
    t.date "date_to", comment: "Last Date of Design Activity"
    t.index ["store_id"], name: "DESIGN_CHANGE_STORE_ID"
  end

  create_table "design_config_grid_flat", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "design_config_grid_flat", force: :cascade do |t|
    t.integer "store_website_id", comment: "Store_website_id"
    t.integer "store_group_id", comment: "Store_group_id"
    t.integer "store_id", comment: "Store_id"
    t.string "theme_theme_id", comment: "Theme_theme_id"
    t.index ["store_group_id"], name: "DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID"
    t.index ["store_id"], name: "DESIGN_CONFIG_GRID_FLAT_STORE_ID"
    t.index ["store_website_id"], name: "DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID"
    t.index ["theme_theme_id"], name: "DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID", type: :fulltext
  end

  create_table "directory_country", primary_key: "country_id", id: { type: :string, limit: 2, comment: "Country ID in ISO-2" }, charset: "utf8", comment: "Directory Country", force: :cascade do |t|
    t.string "iso2_code", limit: 2, comment: "Country ISO-2 format"
    t.string "iso3_code", limit: 3, comment: "Country ISO-3"
  end

  create_table "directory_country_format", primary_key: "country_format_id", id: { type: :integer, comment: "Country Format ID", unsigned: true }, charset: "utf8", comment: "Directory Country Format", force: :cascade do |t|
    t.string "country_id", limit: 2, comment: "Country ID in ISO-2"
    t.string "type", limit: 30, comment: "Country Format Type"
    t.text "format", null: false, comment: "Country Format"
    t.index ["country_id", "type"], name: "DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE", unique: true
  end

  create_table "directory_country_region", primary_key: "region_id", id: { type: :integer, comment: "Region ID", unsigned: true }, charset: "utf8", comment: "Directory Country Region", force: :cascade do |t|
    t.string "country_id", limit: 4, default: "0", null: false, comment: "Country ID in ISO-2"
    t.string "code", limit: 32, comment: "Region code"
    t.string "default_name", comment: "Region Name"
    t.index ["country_id"], name: "DIRECTORY_COUNTRY_REGION_COUNTRY_ID"
  end

  create_table "directory_country_region_name", primary_key: ["locale", "region_id"], charset: "utf8", comment: "Directory Country Region Name", force: :cascade do |t|
    t.string "locale", limit: 16, null: false, comment: "Locale"
    t.integer "region_id", default: 0, null: false, comment: "Region ID", unsigned: true
    t.string "name", comment: "Region Name"
    t.index ["region_id"], name: "DIRECTORY_COUNTRY_REGION_NAME_REGION_ID"
  end

  create_table "directory_currency_rate", primary_key: ["currency_from", "currency_to"], charset: "utf8", comment: "Directory Currency Rate", force: :cascade do |t|
    t.string "currency_from", limit: 3, null: false, comment: "Currency Code Convert From"
    t.string "currency_to", limit: 3, null: false, comment: "Currency Code Convert To"
    t.decimal "rate", precision: 24, scale: 12, default: "0.0", null: false, comment: "Currency Conversion Rate"
    t.index ["currency_to"], name: "DIRECTORY_CURRENCY_RATE_CURRENCY_TO"
  end

  create_table "downloadable_link", primary_key: "link_id", id: { type: :integer, comment: "Link ID", unsigned: true }, charset: "utf8", comment: "Downloadable Link Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort order", unsigned: true
    t.integer "number_of_downloads", comment: "Number of downloads"
    t.integer "is_shareable", limit: 2, default: 0, null: false, comment: "Shareable flag", unsigned: true
    t.string "link_url", comment: "Link Url"
    t.string "link_file", comment: "Link File"
    t.string "link_type", limit: 20, comment: "Link Type"
    t.string "sample_url", comment: "Sample Url"
    t.string "sample_file", comment: "Sample File"
    t.string "sample_type", limit: 20, comment: "Sample Type"
    t.index ["product_id", "sort_order"], name: "DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER"
  end

  create_table "downloadable_link_price", primary_key: "price_id", id: { type: :integer, comment: "Price ID", unsigned: true }, charset: "utf8", comment: "Downloadable Link Price Table", force: :cascade do |t|
    t.integer "link_id", default: 0, null: false, comment: "Link ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Price"
    t.index ["link_id"], name: "DOWNLOADABLE_LINK_PRICE_LINK_ID"
    t.index ["website_id"], name: "DOWNLOADABLE_LINK_PRICE_WEBSITE_ID"
  end

  create_table "downloadable_link_purchased", primary_key: "purchased_id", id: { type: :integer, comment: "Purchased ID", unsigned: true }, charset: "utf8", comment: "Downloadable Link Purchased Table", force: :cascade do |t|
    t.integer "order_id", default: 0, comment: "Order ID", unsigned: true
    t.string "order_increment_id", limit: 50, comment: "Order Increment ID"
    t.integer "order_item_id", default: 0, null: false, comment: "Order Item ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of creation"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of modification"
    t.integer "customer_id", default: 0, comment: "Customer ID", unsigned: true
    t.string "product_name", comment: "Product name"
    t.string "product_sku", comment: "Product sku"
    t.string "link_section_title", comment: "Link_section_title"
    t.index ["customer_id"], name: "DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID"
    t.index ["order_id"], name: "DOWNLOADABLE_LINK_PURCHASED_ORDER_ID"
    t.index ["order_item_id"], name: "DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID"
  end

  create_table "downloadable_link_purchased_item", primary_key: "item_id", id: { type: :integer, comment: "Item ID", unsigned: true }, charset: "utf8", comment: "Downloadable Link Purchased Item Table", force: :cascade do |t|
    t.integer "purchased_id", default: 0, null: false, comment: "Purchased ID", unsigned: true
    t.integer "order_item_id", default: 0, comment: "Order Item ID", unsigned: true
    t.integer "product_id", default: 0, comment: "Product ID", unsigned: true
    t.string "link_hash", comment: "Link hash"
    t.integer "number_of_downloads_bought", default: 0, null: false, comment: "Number of downloads bought", unsigned: true
    t.integer "number_of_downloads_used", default: 0, null: false, comment: "Number of downloads used", unsigned: true
    t.integer "link_id", default: 0, null: false, comment: "Link ID", unsigned: true
    t.string "link_title", comment: "Link Title"
    t.integer "is_shareable", limit: 2, default: 0, null: false, comment: "Shareable Flag", unsigned: true
    t.string "link_url", comment: "Link Url"
    t.string "link_file", comment: "Link File"
    t.string "link_type", comment: "Link Type"
    t.string "status", limit: 50, comment: "Status"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Update Time"
    t.index ["link_hash"], name: "DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH"
    t.index ["order_item_id"], name: "DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID"
    t.index ["purchased_id"], name: "DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID"
  end

  create_table "downloadable_link_title", primary_key: "title_id", id: { type: :integer, comment: "Title ID", unsigned: true }, charset: "utf8", comment: "Link Title Table", force: :cascade do |t|
    t.integer "link_id", default: 0, null: false, comment: "Link ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "title", comment: "Title"
    t.index ["link_id", "store_id"], name: "DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "DOWNLOADABLE_LINK_TITLE_STORE_ID"
  end

  create_table "downloadable_sample", primary_key: "sample_id", id: { type: :integer, comment: "Sample ID", unsigned: true }, charset: "utf8", comment: "Downloadable Sample Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.string "sample_url", comment: "Sample URL"
    t.string "sample_file", comment: "Sample file"
    t.string "sample_type", limit: 20, comment: "Sample Type"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["product_id"], name: "DOWNLOADABLE_SAMPLE_PRODUCT_ID"
  end

  create_table "downloadable_sample_title", primary_key: "title_id", id: { type: :integer, comment: "Title ID", unsigned: true }, charset: "utf8", comment: "Downloadable Sample Title Table", force: :cascade do |t|
    t.integer "sample_id", default: 0, null: false, comment: "Sample ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "title", comment: "Title"
    t.index ["sample_id", "store_id"], name: "DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "DOWNLOADABLE_SAMPLE_TITLE_STORE_ID"
  end

  create_table "eav_attribute", primary_key: "attribute_id", id: { type: :integer, limit: 2, comment: "Attribute ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.string "attribute_code", null: false, comment: "Attribute Code"
    t.string "attribute_model", comment: "Attribute Model"
    t.string "backend_model", comment: "Backend Model"
    t.string "backend_type", limit: 8, default: "static", null: false, comment: "Backend Type"
    t.string "backend_table", comment: "Backend Table"
    t.string "frontend_model", comment: "Frontend Model"
    t.string "frontend_input", limit: 50, comment: "Frontend Input"
    t.string "frontend_label", comment: "Frontend Label"
    t.string "frontend_class", comment: "Frontend Class"
    t.string "source_model", comment: "Source Model"
    t.integer "is_required", limit: 2, default: 0, null: false, comment: "Defines Is Required", unsigned: true
    t.integer "is_user_defined", limit: 2, default: 0, null: false, comment: "Defines Is User Defined", unsigned: true
    t.text "default_value", comment: "Default Value"
    t.integer "is_unique", limit: 2, default: 0, null: false, comment: "Defines Is Unique", unsigned: true
    t.string "note", comment: "Note"
    t.index ["entity_type_id", "attribute_code"], name: "EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE", unique: true
    t.index ["frontend_input", "entity_type_id", "is_user_defined"], name: "EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED"
  end

  create_table "eav_attribute_group", primary_key: "attribute_group_id", id: { type: :integer, limit: 2, comment: "Attribute Group ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute Group", force: :cascade do |t|
    t.integer "attribute_set_id", limit: 2, default: 0, null: false, comment: "Attribute Set ID", unsigned: true
    t.string "attribute_group_name", comment: "Attribute Group Name"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order"
    t.integer "default_id", limit: 2, default: 0, comment: "Default ID", unsigned: true
    t.string "attribute_group_code", null: false, comment: "Attribute Group Code"
    t.string "tab_group_code", comment: "Tab Group Code"
    t.index ["attribute_set_id", "attribute_group_code"], name: "EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE", unique: true
    t.index ["attribute_set_id", "attribute_group_name"], name: "EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME", unique: true
    t.index ["attribute_set_id", "sort_order"], name: "EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER"
  end

  create_table "eav_attribute_label", primary_key: "attribute_label_id", id: { type: :integer, comment: "Attribute Label ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute Label", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["attribute_id", "store_id"], name: "EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID"
    t.index ["store_id"], name: "EAV_ATTRIBUTE_LABEL_STORE_ID"
  end

  create_table "eav_attribute_option", primary_key: "option_id", id: { type: :integer, comment: "Option ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute Option", force: :cascade do |t|
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order", unsigned: true
    t.index ["attribute_id"], name: "EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID"
  end

  create_table "eav_attribute_option_swatch", primary_key: "swatch_id", id: { type: :integer, comment: "Swatch ID", unsigned: true }, charset: "utf8", comment: "Magento Swatches table", force: :cascade do |t|
    t.integer "option_id", null: false, comment: "Option ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.integer "type", limit: 2, null: false, comment: "Swatch type: 0 - text, 1 - visual color, 2 - visual image", unsigned: true
    t.string "value", comment: "Swatch Value"
    t.index ["option_id"], name: "EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID"
    t.index ["store_id", "option_id"], name: "EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID", unique: true
    t.index ["swatch_id"], name: "EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID"
  end

  create_table "eav_attribute_option_value", primary_key: "value_id", id: { type: :integer, comment: "Value ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute Option Value", force: :cascade do |t|
    t.integer "option_id", default: 0, null: false, comment: "Option ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "value", comment: "Value"
    t.index ["option_id"], name: "EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID"
    t.index ["store_id"], name: "EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID"
  end

  create_table "eav_attribute_set", primary_key: "attribute_set_id", id: { type: :integer, limit: 2, comment: "Attribute Set ID", unsigned: true }, charset: "utf8", comment: "Eav Attribute Set", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.string "attribute_set_name", comment: "Attribute Set Name"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order"
    t.index ["entity_type_id", "attribute_set_name"], name: "EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME", unique: true
    t.index ["entity_type_id", "sort_order"], name: "EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER"
  end

  create_table "eav_entity", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Eav Entity", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_set_id", limit: 2, default: 0, null: false, comment: "Attribute Set ID", unsigned: true
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.integer "parent_id", default: 0, null: false, comment: "Parent ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Defines Is Entity Active", unsigned: true
    t.index ["entity_type_id"], name: "EAV_ENTITY_ENTITY_TYPE_ID"
    t.index ["store_id"], name: "EAV_ENTITY_STORE_ID"
  end

  create_table "eav_entity_attribute", primary_key: "entity_attribute_id", id: { type: :integer, comment: "Entity Attribute ID", unsigned: true }, charset: "utf8", comment: "Eav Entity Attributes", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_set_id", limit: 2, default: 0, null: false, comment: "Attribute Set ID", unsigned: true
    t.integer "attribute_group_id", limit: 2, default: 0, null: false, comment: "Attribute Group ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order"
    t.index ["attribute_group_id", "attribute_id"], name: "EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID", unique: true
    t.index ["attribute_id"], name: "EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID"
    t.index ["attribute_set_id", "attribute_id"], name: "EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID", unique: true
    t.index ["attribute_set_id", "sort_order"], name: "EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER"
  end

  create_table "eav_entity_datetime", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Eav Entity Value Prefix", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.datetime "value", comment: "Attribute Value"
    t.index ["attribute_id", "value"], name: "EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id", "store_id"], name: "EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_type_id", "value"], name: "EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE"
    t.index ["store_id"], name: "EAV_ENTITY_DATETIME_STORE_ID"
  end

  create_table "eav_entity_decimal", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Eav Entity Value Prefix", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Attribute Value"
    t.index ["attribute_id", "value"], name: "EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id", "store_id"], name: "EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_type_id", "value"], name: "EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE"
    t.index ["store_id"], name: "EAV_ENTITY_DECIMAL_STORE_ID"
  end

  create_table "eav_entity_int", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Eav Entity Value Prefix", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "value", default: 0, null: false, comment: "Attribute Value"
    t.index ["attribute_id", "value"], name: "EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id", "store_id"], name: "EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_type_id", "value"], name: "EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE"
    t.index ["store_id"], name: "EAV_ENTITY_INT_STORE_ID"
  end

  create_table "eav_entity_store", primary_key: "entity_store_id", id: { type: :integer, comment: "Entity Store ID", unsigned: true }, charset: "utf8", comment: "Eav Entity Store", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "increment_prefix", limit: 20, comment: "Increment Prefix"
    t.string "increment_last_id", limit: 50, comment: "Last Incremented ID"
    t.index ["entity_type_id"], name: "EAV_ENTITY_STORE_ENTITY_TYPE_ID"
    t.index ["store_id"], name: "EAV_ENTITY_STORE_STORE_ID"
  end

  create_table "eav_entity_text", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Eav Entity Value Prefix", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.text "value", null: false, comment: "Attribute Value"
    t.index ["attribute_id"], name: "EAV_ENTITY_TEXT_ATTRIBUTE_ID"
    t.index ["entity_id", "attribute_id", "store_id"], name: "EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_type_id"], name: "EAV_ENTITY_TEXT_ENTITY_TYPE_ID"
    t.index ["store_id"], name: "EAV_ENTITY_TEXT_STORE_ID"
  end

  create_table "eav_entity_type", primary_key: "entity_type_id", id: { type: :integer, limit: 2, comment: "Entity Type ID", unsigned: true }, charset: "utf8", comment: "Eav Entity Type", force: :cascade do |t|
    t.string "entity_type_code", limit: 50, null: false, comment: "Entity Type Code"
    t.string "entity_model", null: false, comment: "Entity Model"
    t.string "attribute_model", comment: "Attribute Model"
    t.string "entity_table", comment: "Entity Table"
    t.string "value_table_prefix", comment: "Value Table Prefix"
    t.string "entity_id_field", comment: "Entity ID Field"
    t.integer "is_data_sharing", limit: 2, default: 1, null: false, comment: "Defines Is Data Sharing", unsigned: true
    t.string "data_sharing_key", limit: 100, default: "default", comment: "Data Sharing Key"
    t.integer "default_attribute_set_id", limit: 2, default: 0, null: false, comment: "Default Attribute Set ID", unsigned: true
    t.string "increment_model", comment: "Increment Model"
    t.integer "increment_per_store", limit: 2, default: 0, null: false, comment: "Increment Per Store", unsigned: true
    t.integer "increment_pad_length", limit: 2, default: 8, null: false, comment: "Increment Pad Length", unsigned: true
    t.string "increment_pad_char", limit: 1, default: "0", null: false, comment: "Increment Pad Char"
    t.string "additional_attribute_table", comment: "Additional Attribute Table"
    t.string "entity_attribute_collection", comment: "Entity Attribute Collection"
    t.index ["entity_type_code"], name: "EAV_ENTITY_TYPE_ENTITY_TYPE_CODE"
  end

  create_table "eav_entity_varchar", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Eav Entity Value Prefix", force: :cascade do |t|
    t.integer "entity_type_id", limit: 2, default: 0, null: false, comment: "Entity Type ID", unsigned: true
    t.integer "attribute_id", limit: 2, default: 0, null: false, comment: "Attribute ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "value", comment: "Attribute Value"
    t.index ["attribute_id", "value"], name: "EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE"
    t.index ["entity_id", "attribute_id", "store_id"], name: "EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID", unique: true
    t.index ["entity_type_id", "value"], name: "EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE"
    t.index ["store_id"], name: "EAV_ENTITY_VARCHAR_STORE_ID"
  end

  create_table "eav_form_element", primary_key: "element_id", id: { type: :integer, comment: "Element ID", unsigned: true }, charset: "utf8", comment: "Eav Form Element", force: :cascade do |t|
    t.integer "type_id", limit: 2, null: false, comment: "Type ID", unsigned: true
    t.integer "fieldset_id", limit: 2, comment: "Fieldset ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order"
    t.index ["attribute_id"], name: "EAV_FORM_ELEMENT_ATTRIBUTE_ID"
    t.index ["fieldset_id"], name: "EAV_FORM_ELEMENT_FIELDSET_ID"
    t.index ["type_id", "attribute_id"], name: "EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID", unique: true
  end

  create_table "eav_form_fieldset", primary_key: "fieldset_id", id: { type: :integer, limit: 2, comment: "Fieldset ID", unsigned: true }, charset: "utf8", comment: "Eav Form Fieldset", force: :cascade do |t|
    t.integer "type_id", limit: 2, null: false, comment: "Type ID", unsigned: true
    t.string "code", limit: 64, null: false, comment: "Code"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order"
    t.index ["type_id", "code"], name: "EAV_FORM_FIELDSET_TYPE_ID_CODE", unique: true
  end

  create_table "eav_form_fieldset_label", primary_key: ["fieldset_id", "store_id"], charset: "utf8", comment: "Eav Form Fieldset Label", force: :cascade do |t|
    t.integer "fieldset_id", limit: 2, null: false, comment: "Fieldset ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "label", null: false, comment: "Label"
    t.index ["store_id"], name: "EAV_FORM_FIELDSET_LABEL_STORE_ID"
  end

  create_table "eav_form_type", primary_key: "type_id", id: { type: :integer, limit: 2, comment: "Type ID", unsigned: true }, charset: "utf8", comment: "Eav Form Type", force: :cascade do |t|
    t.string "code", limit: 64, null: false, comment: "Code"
    t.string "label", null: false, comment: "Label"
    t.integer "is_system", limit: 2, default: 0, null: false, comment: "Is System", unsigned: true
    t.string "theme", limit: 64, comment: "Theme"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["code", "theme", "store_id"], name: "EAV_FORM_TYPE_CODE_THEME_STORE_ID", unique: true
    t.index ["store_id"], name: "EAV_FORM_TYPE_STORE_ID"
  end

  create_table "eav_form_type_entity", primary_key: ["type_id", "entity_type_id"], charset: "utf8", comment: "Eav Form Type Entity", force: :cascade do |t|
    t.integer "type_id", limit: 2, null: false, comment: "Type ID", unsigned: true
    t.integer "entity_type_id", limit: 2, null: false, comment: "Entity Type ID", unsigned: true
    t.index ["entity_type_id"], name: "EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID"
  end

  create_table "email_abandoned_cart", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Abandoned Carts Table", force: :cascade do |t|
    t.integer "quote_id", comment: "Quote Id", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store Id", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.string "email", default: "", null: false, comment: "Email"
    t.string "status", default: "", null: false, comment: "Contact Status"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Quote Active", unsigned: true
    t.timestamp "quote_updated_at", comment: "Quote updated at"
    t.integer "abandoned_cart_number", limit: 2, default: 0, null: false, comment: "Abandoned Cart number", unsigned: true
    t.integer "items_count", limit: 2, default: 0, comment: "Quote items count", unsigned: true
    t.string "items_ids", comment: "Quote item ids"
    t.timestamp "created_at", comment: "Created At"
    t.timestamp "updated_at", comment: "Updated at"
    t.index ["customer_id"], name: "EMAIL_ABANDONED_CART_CUSTOMER_ID"
    t.index ["email"], name: "EMAIL_ABANDONED_CART_EMAIL"
    t.index ["quote_id"], name: "EMAIL_ABANDONED_CART_QUOTE_ID"
    t.index ["store_id"], name: "EMAIL_ABANDONED_CART_STORE_ID"
  end

  create_table "email_automation", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Automation Status", force: :cascade do |t|
    t.string "automation_type", comment: "Automation Type"
    t.string "store_name", comment: "Automation Type"
    t.string "enrolment_status", null: false, comment: "Enrolment Status"
    t.string "email", comment: "Email"
    t.string "type_id", comment: "Type ID"
    t.string "program_id", comment: "Program ID"
    t.integer "website_id", limit: 2, null: false, comment: "Website Id", unsigned: true
    t.string "message", null: false, comment: "Message"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["automation_type"], name: "EMAIL_AUTOMATION_AUTOMATION_TYPE"
    t.index ["created_at"], name: "EMAIL_AUTOMATION_CREATED_AT"
    t.index ["email"], name: "EMAIL_AUTOMATION_EMAIL"
    t.index ["enrolment_status"], name: "EMAIL_AUTOMATION_ENROLMENT_STATUS"
    t.index ["program_id"], name: "EMAIL_AUTOMATION_PROGRAM_ID"
    t.index ["type_id"], name: "EMAIL_AUTOMATION_TYPE_ID"
    t.index ["updated_at"], name: "EMAIL_AUTOMATION_UPDATED_AT"
    t.index ["website_id"], name: "EMAIL_AUTOMATION_WEBSITE_ID"
  end

  create_table "email_campaign", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Campaigns", force: :cascade do |t|
    t.integer "campaign_id", null: false, comment: "Campaign ID", unsigned: true
    t.string "email", default: "", null: false, comment: "Contact Email"
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.timestamp "sent_at", comment: "Send Date"
    t.string "order_increment_id", limit: 50, null: false, comment: "Order Increment ID"
    t.integer "quote_id", null: false, comment: "Sales Quote ID", unsigned: true
    t.string "message", default: "", null: false, comment: "Error Message"
    t.string "checkout_method", default: "", null: false, comment: "Checkout Method Used"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "event_name", default: "", null: false, comment: "Event Name"
    t.string "send_id", default: "", null: false, comment: "Send Id"
    t.integer "send_status", limit: 2, default: 0, null: false, comment: "Campaign send status"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["campaign_id"], name: "EMAIL_CAMPAIGN_CAMPAIGN_ID"
    t.index ["created_at"], name: "EMAIL_CAMPAIGN_CREATED_AT"
    t.index ["customer_id"], name: "EMAIL_CAMPAIGN_CUSTOMER_ID"
    t.index ["email"], name: "EMAIL_CAMPAIGN_EMAIL"
    t.index ["event_name"], name: "EMAIL_CAMPAIGN_EVENT_NAME"
    t.index ["message"], name: "EMAIL_CAMPAIGN_MESSAGE"
    t.index ["quote_id"], name: "EMAIL_CAMPAIGN_QUOTE_ID"
    t.index ["send_id"], name: "EMAIL_CAMPAIGN_SEND_ID"
    t.index ["send_status"], name: "EMAIL_CAMPAIGN_SEND_STATUS"
    t.index ["sent_at"], name: "EMAIL_CAMPAIGN_SENT_AT"
    t.index ["store_id"], name: "EMAIL_CAMPAIGN_STORE_ID"
    t.index ["updated_at"], name: "EMAIL_CAMPAIGN_UPDATED_AT"
  end

  create_table "email_catalog", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Catalog", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product Id", unsigned: true
    t.integer "processed", limit: 2, null: false, comment: "Product processed", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.timestamp "last_imported_at", comment: "Last imported date"
    t.index ["created_at"], name: "EMAIL_CATALOG_CREATED_AT"
    t.index ["last_imported_at"], name: "EMAIL_CATALOG_LAST_IMPORTED_AT"
    t.index ["processed"], name: "EMAIL_CATALOG_PROCESSED"
    t.index ["product_id"], name: "EMAIL_CATALOG_PRODUCT_ID"
    t.index ["updated_at"], name: "EMAIL_CATALOG_UPDATED_AT"
  end

  create_table "email_contact", primary_key: "email_contact_id", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Contacts", force: :cascade do |t|
    t.integer "is_guest", limit: 2, comment: "Is Guest", unsigned: true
    t.string "contact_id", limit: 15, comment: "Connector Contact ID"
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "email", default: "", null: false, comment: "Customer Email"
    t.integer "is_subscriber", limit: 2, comment: "Is Subscriber", unsigned: true
    t.integer "subscriber_status", limit: 2, comment: "Subscriber status", unsigned: true
    t.integer "email_imported", limit: 2, default: 0, null: false, comment: "Is Imported", unsigned: true
    t.integer "subscriber_imported", limit: 2, default: 0, null: false, comment: "Is Subscriber Imported", unsigned: true
    t.integer "suppressed", limit: 2, comment: "Is Suppressed", unsigned: true
    t.timestamp "last_subscribed_at", comment: "Last time user subscribed"
    t.index ["contact_id"], name: "EMAIL_CONTACT_CONTACT_ID"
    t.index ["customer_id"], name: "EMAIL_CONTACT_CUSTOMER_ID"
    t.index ["email"], name: "EMAIL_CONTACT_EMAIL"
    t.index ["email_contact_id"], name: "EMAIL_CONTACT_EMAIL_CONTACT_ID"
    t.index ["email_imported"], name: "EMAIL_CONTACT_EMAIL_IMPORTED"
    t.index ["is_guest"], name: "EMAIL_CONTACT_IS_GUEST"
    t.index ["is_subscriber"], name: "EMAIL_CONTACT_IS_SUBSCRIBER"
    t.index ["subscriber_imported"], name: "EMAIL_CONTACT_SUBSCRIBER_IMPORTED"
    t.index ["subscriber_status"], name: "EMAIL_CONTACT_SUBSCRIBER_STATUS"
    t.index ["suppressed"], name: "EMAIL_CONTACT_SUPPRESSED"
    t.index ["website_id"], name: "EMAIL_CONTACT_WEBSITE_ID"
  end

  create_table "email_contact_consent", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Email contact consent table.", force: :cascade do |t|
    t.integer "email_contact_id", comment: "Email Contact Id", unsigned: true
    t.string "consent_url", comment: "Contact consent url"
    t.datetime "consent_datetime", comment: "Contact consent datetime"
    t.string "consent_ip", comment: "Contact consent ip"
    t.string "consent_user_agent", comment: "Contact consent user agent"
    t.index ["email_contact_id"], name: "EMAIL_CONTACT_CONSENT_EMAIL_CONTACT_ID"
  end

  create_table "email_coupon_attribute", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Dotdigital coupon attributes table", force: :cascade do |t|
    t.integer "salesrule_coupon_id", null: false, comment: "Coupon ID", unsigned: true
    t.string "email", comment: "Email"
    t.timestamp "expires_at", comment: "Coupon expiration date"
    t.index ["email"], name: "EMAIL_COUPON_ATTRIBUTE_EMAIL"
    t.index ["salesrule_coupon_id"], name: "EMAIL_COUPON_ATTRIBUTE_COUPON_ID"
  end

  create_table "email_failed_auth", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Email Failed Auth Table.", force: :cascade do |t|
    t.integer "failures_num", comment: "Number of fails", unsigned: true
    t.datetime "first_attempt_date", comment: "First attempt date"
    t.datetime "last_attempt_date", comment: "Last attempt date"
    t.string "url", comment: "URL"
    t.integer "store_id", comment: "Store Id", unsigned: true
    t.index ["store_id"], name: "EMAIL_AUTH_EDC_STORE_ID"
  end

  create_table "email_importer", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Email Importer", force: :cascade do |t|
    t.string "import_type", default: "", null: false, comment: "Import Type"
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website Id"
    t.integer "import_status", limit: 2, default: 0, null: false, comment: "Import Status"
    t.string "import_id", default: "", null: false, comment: "Import Id"
    t.binary "import_data", size: :medium, null: false, comment: "Import Data"
    t.string "import_mode", default: "", null: false, comment: "Import Mode"
    t.text "import_file", null: false, comment: "Import File"
    t.string "message", default: "", null: false, comment: "Error Message"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.timestamp "import_started", comment: "Import Started"
    t.timestamp "import_finished", comment: "Import Finished"
    t.index ["created_at"], name: "EMAIL_IMPORTER_CREATED_AT"
    t.index ["import_finished"], name: "EMAIL_IMPORTER_IMPORT_FINISHED"
    t.index ["import_id"], name: "EMAIL_IMPORTER_IMPORT_ID"
    t.index ["import_mode"], name: "EMAIL_IMPORTER_IMPORT_MODE"
    t.index ["import_started"], name: "EMAIL_IMPORTER_IMPORT_STARTED"
    t.index ["import_status"], name: "EMAIL_IMPORTER_IMPORT_STATUS"
    t.index ["import_type"], name: "EMAIL_IMPORTER_IMPORT_TYPE"
    t.index ["updated_at"], name: "EMAIL_IMPORTER_UPDATED_AT"
    t.index ["website_id"], name: "EMAIL_IMPORTER_WEBSITE_ID"
  end

  create_table "email_order", primary_key: "email_order_id", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Transactional Order Data", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.string "order_status", null: false, comment: "Order Status"
    t.integer "quote_id", null: false, comment: "Sales Quote ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "email_imported", limit: 2, default: 0, null: false, comment: "Is Order Imported", unsigned: true
    t.integer "modified", limit: 2, comment: "Is Order Modified", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["created_at"], name: "EMAIL_ORDER_CREATED_AT"
    t.index ["email_imported"], name: "EMAIL_ORDER_EMAIL_IMPORTED"
    t.index ["modified"], name: "EMAIL_ORDER_MODIFIED"
    t.index ["order_id"], name: "EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID"
    t.index ["order_status"], name: "EMAIL_ORDER_ORDER_STATUS"
    t.index ["quote_id"], name: "EMAIL_ORDER_QUOTE_ID"
    t.index ["store_id"], name: "EMAIL_ORDER_STORE_ID"
    t.index ["updated_at"], name: "EMAIL_ORDER_UPDATED_AT"
  end

  create_table "email_review", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Reviews", force: :cascade do |t|
    t.integer "review_id", null: false, comment: "Review Id", unsigned: true
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store Id", unsigned: true
    t.integer "review_imported", limit: 2, default: 0, null: false, comment: "Review Imported", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["created_at"], name: "EMAIL_REVIEW_CREATED_AT"
    t.index ["customer_id"], name: "EMAIL_REVIEW_CUSTOMER_ID"
    t.index ["review_id"], name: "EMAIL_REVIEW_REVIEW_ID"
    t.index ["review_imported"], name: "EMAIL_REVIEW_REVIEW_IMPORTED"
    t.index ["store_id"], name: "EMAIL_REVIEW_STORE_ID"
    t.index ["updated_at"], name: "EMAIL_REVIEW_UPDATED_AT"
  end

  create_table "email_rules", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Rules", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "Rule Name"
    t.string "website_ids", default: "0", null: false, comment: "Website Id"
    t.integer "type", limit: 2, default: 0, null: false, comment: "Rule Type"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status"
    t.integer "combination", limit: 2, default: 1, null: false, comment: "Rule Condition"
    t.binary "conditions", null: false, comment: "Rule Conditions"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
  end

  create_table "email_template", primary_key: "template_id", id: { type: :integer, comment: "Template ID", unsigned: true }, charset: "utf8", comment: "Email Templates", force: :cascade do |t|
    t.string "template_code", limit: 150, null: false, comment: "Template Name"
    t.text "template_text", null: false, comment: "Template Content"
    t.text "template_styles", comment: "Templste Styles"
    t.integer "template_type", comment: "Template Type", unsigned: true
    t.string "template_subject", limit: 200, null: false, comment: "Template Subject"
    t.string "template_sender_name", limit: 200, comment: "Template Sender Name"
    t.string "template_sender_email", limit: 200, comment: "Template Sender Email"
    t.timestamp "added_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of Template Creation"
    t.timestamp "modified_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of Template Modification"
    t.string "orig_template_code", limit: 200, comment: "Original Template Code"
    t.text "orig_template_variables", comment: "Original Template Variables"
    t.boolean "is_legacy", default: false, null: false, comment: "Should the template render in legacy mode"
    t.index ["added_at"], name: "EMAIL_TEMPLATE_ADDED_AT"
    t.index ["modified_at"], name: "EMAIL_TEMPLATE_MODIFIED_AT"
    t.index ["template_code"], name: "EMAIL_TEMPLATE_TEMPLATE_CODE", unique: true
  end

  create_table "email_wishlist", id: { type: :integer, comment: "Primary Key", unsigned: true }, charset: "utf8", comment: "Connector Wishlist", force: :cascade do |t|
    t.integer "wishlist_id", null: false, comment: "Wishlist Id", unsigned: true
    t.integer "item_count", null: false, comment: "Item Count", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store Id", unsigned: true
    t.integer "wishlist_imported", limit: 2, default: 0, null: false, comment: "Wishlist Imported", unsigned: true
    t.integer "wishlist_modified", limit: 2, comment: "Wishlist Modified", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["created_at"], name: "EMAIL_WISHLIST_CREATED_AT"
    t.index ["customer_id"], name: "EMAIL_WISHLIST_CUSTOMER_ID"
    t.index ["item_count"], name: "EMAIL_WISHLIST_ITEM_COUNT"
    t.index ["store_id"], name: "EMAIL_WISHLIST_STORE_ID"
    t.index ["updated_at"], name: "EMAIL_WISHLIST_UPDATED_AT"
    t.index ["wishlist_id"], name: "EMAIL_WISHLIST_WISHLIST_ID"
    t.index ["wishlist_imported"], name: "EMAIL_WISHLIST_WISHLIST_IMPORTED"
    t.index ["wishlist_modified"], name: "EMAIL_WISHLIST_WISHLIST_MODIFIED"
  end

  create_table "events_url_rewrite", primary_key: "event_url_rewrite_id", id: { type: :integer, comment: "Event Url Rewrite ID", unsigned: true }, charset: "utf8", comment: "Event Url Rewrite", force: :cascade do |t|
    t.string "entity_type", limit: 32, null: false, comment: "Entity type code"
    t.integer "reference_id", null: false, comment: "Event Entity ID", unsigned: true
    t.string "request_path", comment: "Request Path"
    t.string "target_path", comment: "Target Path"
    t.index ["request_path"], name: "EVENTS_URL_REWRITE_REQUEST_PATH", unique: true
    t.index ["target_path"], name: "EVENTS_URL_REWRITE_TARGET_PATH"
  end

  create_table "firebear_export_history", primary_key: "history_id", id: { type: :integer, comment: "History Id" }, charset: "utf8", comment: "Export Jobs", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "Job Id"
    t.timestamp "started_at", comment: "Started"
    t.timestamp "finished_at", comment: "Finished"
    t.string "type", limit: 100, comment: "Type"
    t.string "file", null: false, comment: "Exported File"
    t.text "temp_file", comment: "Temp file export"
    t.index ["history_id"], name: "FIREBEAR_EXPORT_HISTORY_HISTORY_ID"
    t.index ["job_id"], name: "FIREBEAR_EXPORT_HISTORY_JOB_ID_FIREBEAR_EXPORT_JOBS_ENTITY_ID"
  end

  create_table "firebear_export_jobs", primary_key: "entity_id", id: { type: :integer, comment: "Job Id" }, charset: "utf8", comment: "File Updated At", force: :cascade do |t|
    t.string "title", null: false, comment: "Title"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Job Active"
    t.string "cron", limit: 100, comment: "Cron schedule"
    t.string "frequency", limit: 10, null: false, comment: "Frequency"
    t.string "entity", limit: 100, null: false, comment: "Entity Type"
    t.text "behavior_data", null: false, comment: "Behavior Data (json)"
    t.text "export_source", null: false, comment: "Export Source"
    t.text "source_data", null: false, comment: "Source Data (json)"
    t.timestamp "file_updated_at", comment: "File Updated At"
    t.binary "xslt", size: :long, comment: "Xslt"
  end

  create_table "firebear_export_jobs_event", primary_key: ["job_id", "event"], charset: "utf8", comment: "Export job event", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "Job Id"
    t.string "event", null: false, comment: "Event name"
    t.index ["event"], name: "FIREBEAR_EXPORT_JOBS_EVENT_EVENT"
  end

  create_table "firebear_import_history", primary_key: "history_id", id: { type: :integer, comment: "History Id" }, charset: "utf8", comment: "Export Jobs", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "Job Id"
    t.timestamp "started_at", comment: "Started"
    t.timestamp "finished_at", comment: "Finished"
    t.string "type", limit: 100, comment: "Type"
    t.string "file", null: false, comment: "Imported File"
    t.index ["history_id"], name: "FIREBEAR_IMPORT_HISTORY_HISTORY_ID"
    t.index ["job_id"], name: "FIREBEAR_IMPORT_HISTORY_JOB_ID_FIREBEAR_IMPORT_JOBS_ENTITY_ID"
  end

  create_table "firebear_import_job_mapping", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Import Attributes Mapping", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "Job Id"
    t.integer "attribute_id", limit: 2, comment: "Magento Attribute Id", unsigned: true
    t.string "special_attribute", comment: "Special System Attribute"
    t.string "import_code", comment: "Import Attribute Code"
    t.string "default_value", comment: "Default Value"
    t.integer "custom", limit: 2, default: 0, comment: "Default Value"
    t.index ["attribute_id"], name: "IMPORT_JOB_MAPPING_ATTRIBUTE_ID"
    t.index ["job_id", "attribute_id"], name: "IMPORT_JOB_MAPPING_JOB_ID_ATTRIBUTE_ID", unique: true
    t.index ["job_id"], name: "IMPORT_JOB_MAPPING_JOB_ID"
  end

  create_table "firebear_import_jobs", primary_key: "entity_id", id: { type: :integer, comment: "Job Id" }, charset: "utf8", comment: "File Updated At", force: :cascade do |t|
    t.string "title", null: false, comment: "Title"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Job Active"
    t.string "cron", limit: 100, comment: "Cron schedule"
    t.string "frequency", limit: 10, null: false, comment: "Frequency"
    t.string "entity", limit: 100, null: false, comment: "Entity Type"
    t.text "behavior_data", null: false, comment: "Behavior Data (json)"
    t.string "import_source", limit: 100, null: false, comment: "Import Source"
    t.text "source_data", null: false, comment: "Source Data (json)"
    t.timestamp "file_updated_at", comment: "File Updated At"
    t.binary "mapping", comment: "mapping field"
    t.binary "price_rules", comment: "Price rules"
    t.binary "xslt", size: :long, comment: "Xslt"
    t.string "translate_from", comment: "Translate from"
    t.string "translate_to", comment: "Translate to"
  end

  create_table "firebear_importexport_importdata", id: { type: :integer, comment: "Id", unsigned: true }, charset: "utf8", comment: "Firebear Import Data Table", force: :cascade do |t|
    t.string "entity", limit: 50, null: false, comment: "Entity"
    t.string "behavior", limit: 10, default: "append", null: false, comment: "Behavior"
    t.string "subentity", limit: 50, comment: "SubEntity"
    t.string "file", limit: 50, comment: "File"
    t.integer "job_id", null: false, comment: "Job Id"
    t.text "data", size: :long, comment: "Data"
    t.index ["job_id"], name: "FK_9AF4AC7F682E8FAAE2A91E723745CB33"
  end

  create_table "flag", primary_key: "flag_id", id: { type: :integer, comment: "Flag Id", unsigned: true }, charset: "utf8", comment: "Flag", force: :cascade do |t|
    t.string "flag_code", null: false, comment: "Flag Code"
    t.integer "state", limit: 2, default: 0, null: false, comment: "Flag State", unsigned: true
    t.text "flag_data", size: :medium, comment: "Flag Data"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of Last Flag Update"
    t.index ["last_update"], name: "FLAG_LAST_UPDATE"
  end

  create_table "flashsaleevents", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "FlashSale Events", force: :cascade do |t|
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
    t.integer "include_in_menu", limit: 2, default: 0, null: false, comment: "Event - include in menu", unsigned: true
    t.integer "brand_id", null: false, comment: "Brand table entityid"
    t.string "brand_attr_value", null: false, comment: "product attribute value"
    t.string "event_title", null: false, comment: "Event Title"
    t.text "event_description", comment: "Event Description"
    t.string "event_url_key", null: false, comment: "Event Url Key"
    t.string "event_image", comment: "Event Image"
    t.text "event_meta_key", comment: "Event Meta key"
    t.text "event_meta_description", comment: "Event Meta Description"
    t.datetime "event_start", null: false, comment: "Event start"
    t.datetime "event_end", null: false, comment: "Event End"
    t.integer "is_featured_event", limit: 2, default: 0, null: false, comment: "Is Featured", unsigned: true
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "flashsaleevents_product", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "FlashSaleEvents Products", force: :cascade do |t|
    t.integer "event_id", default: 0, null: false, comment: "Falshsale event id"
    t.integer "product_id", default: 0, null: false, comment: "Falshsale product id"
    t.integer "position", default: 0, null: false
  end

  create_table "gift_message", primary_key: "gift_message_id", id: { type: :integer, comment: "GiftMessage ID", unsigned: true }, charset: "utf8", comment: "Gift Message", force: :cascade do |t|
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.string "sender", comment: "Sender"
    t.string "recipient", comment: "Registrant"
    t.text "message", comment: "Message"
  end

  create_table "googleoptimizer_code", primary_key: "code_id", id: { type: :integer, comment: "Google experiment code ID", unsigned: true }, charset: "utf8", comment: "Google Experiment code", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Optimized entity ID product ID or catalog ID", unsigned: true
    t.string "entity_type", limit: 50, comment: "Optimized entity type"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.text "experiment_script", comment: "Google experiment script"
    t.index ["store_id", "entity_id", "entity_type"], name: "GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE", unique: true
  end

  create_table "import_history", primary_key: "history_id", id: { type: :integer, comment: "History record ID", unsigned: true }, charset: "utf8", comment: "Import history table", force: :cascade do |t|
    t.timestamp "started_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Started at"
    t.integer "user_id", default: 0, null: false, comment: "User ID", unsigned: true
    t.string "imported_file", comment: "Imported file"
    t.string "execution_time", comment: "Execution time"
    t.string "summary", comment: "Summary"
    t.string "error_file", null: false, comment: "Imported file with errors"
  end

  create_table "importexport_importdata", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Import Data Table", force: :cascade do |t|
    t.string "entity", limit: 50, null: false, comment: "Entity"
    t.string "behavior", limit: 10, default: "append", null: false, comment: "Behavior"
    t.text "data", size: :long, comment: "Data"
  end

  create_table "indexer_state", primary_key: "state_id", id: { type: :integer, comment: "Indexer State ID", unsigned: true }, charset: "utf8", comment: "Indexer State", force: :cascade do |t|
    t.string "indexer_id", comment: "Indexer ID"
    t.string "status", limit: 16, default: "invalid", comment: "Indexer Status"
    t.datetime "updated", comment: "Indexer Status"
    t.string "hash_config", limit: 32, null: false, comment: "Hash of indexer config"
    t.index ["indexer_id"], name: "INDEXER_STATE_INDEXER_ID"
  end

  create_table "integration", primary_key: "integration_id", id: { type: :integer, comment: "Integration ID", unsigned: true }, charset: "utf8", comment: "integration", force: :cascade do |t|
    t.string "name", null: false, comment: "Integration name is displayed in the admin interface"
    t.string "email", null: false, comment: "Email address of the contact person"
    t.string "endpoint", comment: "Endpoint for posting consumer credentials"
    t.integer "status", limit: 2, null: false, comment: "Integration status", unsigned: true
    t.integer "consumer_id", comment: "Oauth consumer", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Creation Time"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Update Time"
    t.integer "setup_type", limit: 2, default: 0, null: false, comment: "Integration type - manual or config file", unsigned: true
    t.string "identity_link_url", comment: "Identity linking Url"
    t.index ["consumer_id"], name: "INTEGRATION_CONSUMER_ID", unique: true
    t.index ["name"], name: "INTEGRATION_NAME", unique: true
  end

  create_table "inventory_geoname", id: false, charset: "utf8", force: :cascade do |t|
    t.string "country_code", limit: 64, null: false
    t.string "postcode", limit: 64, null: false
    t.string "city", limit: 180, null: false
    t.string "region", limit: 100, null: false
    t.string "province", limit: 64, null: false
    t.float "latitude", limit: 53, null: false
    t.float "longitude", limit: 53, null: false
  end

  create_table "inventory_low_stock_notification_configuration", primary_key: ["source_code", "sku"], charset: "utf8", force: :cascade do |t|
    t.string "source_code", null: false
    t.string "sku", limit: 64, null: false
    t.decimal "notify_stock_qty", precision: 12, scale: 4
  end

  create_table "inventory_order_notification", primary_key: "order_id", id: { type: :integer, comment: "Order ID", unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.integer "notification_sent", limit: 2, null: false, comment: "Has Notification Been Sent For Order"
    t.integer "send_notification", limit: 2, null: false, comment: "Should Notification Be Send For Order"
  end

  create_table "inventory_pickup_location_order", primary_key: "order_id", id: { type: :integer, comment: "Order ID", unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "pickup_location_code", null: false, comment: "Pickup Location Code"
  end

  create_table "inventory_pickup_location_quote_address", primary_key: "address_id", id: { type: :integer, comment: "Quote Address ID", unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "pickup_location_code", null: false, comment: "Pickup Location Code"
  end

  create_table "inventory_reservation", primary_key: "reservation_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.integer "stock_id", null: false, unsigned: true
    t.string "sku", limit: 64, null: false
    t.decimal "quantity", precision: 10, scale: 4, default: "0.0", null: false
    t.string "metadata"
    t.index ["stock_id", "sku", "quantity"], name: "INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY"
  end

  create_table "inventory_shipment_source", primary_key: "shipment_id", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8", force: :cascade do |t|
    t.string "source_code", null: false
  end

  create_table "inventory_source", primary_key: "source_code", id: :string, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "enabled", limit: 2, default: 1, null: false, unsigned: true
    t.text "description"
    t.decimal "latitude", precision: 8, scale: 6
    t.decimal "longitude", precision: 9, scale: 6
    t.string "country_id", limit: 2, null: false
    t.integer "region_id", unsigned: true
    t.string "region"
    t.string "city"
    t.string "street"
    t.string "postcode", null: false
    t.string "contact_name"
    t.string "email"
    t.string "phone"
    t.string "fax"
    t.integer "use_default_carrier_config", limit: 2, default: 1, null: false, unsigned: true
    t.boolean "is_pickup_location_active", default: false, null: false
    t.string "frontend_name", default: ""
    t.text "frontend_description"
  end

  create_table "inventory_source_carrier_link", primary_key: "link_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "source_code", null: false
    t.string "carrier_code", null: false
    t.integer "position", limit: 2, unsigned: true
    t.index ["source_code"], name: "INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE"
  end

  create_table "inventory_source_item", primary_key: "source_item_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "source_code", null: false
    t.string "sku", limit: 64, null: false
    t.decimal "quantity", precision: 12, scale: 4, default: "0.0", null: false
    t.integer "status", limit: 2, default: 0, null: false, unsigned: true
    t.index ["sku", "source_code", "quantity"], name: "INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY"
    t.index ["source_code", "sku"], name: "INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU", unique: true
  end

  create_table "inventory_source_stock_link", primary_key: "link_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.integer "stock_id", null: false, unsigned: true
    t.string "source_code", null: false
    t.integer "priority", limit: 2, null: false, unsigned: true
    t.index ["source_code"], name: "INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE"
    t.index ["stock_id", "priority"], name: "INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY"
    t.index ["stock_id", "source_code"], name: "INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE", unique: true
  end

  create_table "inventory_stock", primary_key: "stock_id", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "inventory_stock_sales_channel", primary_key: ["type", "code"], charset: "utf8", force: :cascade do |t|
    t.string "type", limit: 64, null: false
    t.string "code", limit: 64, null: false
    t.integer "stock_id", null: false, unsigned: true
    t.index ["stock_id"], name: "INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID"
  end

  create_table "item_option_types", charset: "latin1", force: :cascade do |t|
    t.integer "item_id", null: false
    t.bigint "option_type_id", null: false
    t.bigint "option_value_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_type_id"], name: "index_item_option_types_on_option_type_id"
    t.index ["option_value_id"], name: "index_item_option_types_on_option_value_id"
  end

  create_table "klarna_core_order", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Klarna Order", force: :cascade do |t|
    t.string "klarna_order_id", comment: "Klarna Order Id"
    t.string "session_id", comment: "Session Id"
    t.string "reservation_id", comment: "Reservation Id"
    t.integer "order_id", null: false, comment: "Order Id", unsigned: true
    t.integer "is_acknowledged", limit: 2, default: 0, null: false, comment: "Is Acknowledged"
    t.index ["is_acknowledged"], name: "KLARNA_CORE_ORDER_IS_ACKNOWLEDGED"
    t.index ["order_id"], name: "KLARNA_CORE_ORDER_ORDER_ID"
  end

  create_table "klarna_payments_quote", primary_key: "payments_quote_id", id: { type: :integer, comment: "Payments Id", unsigned: true }, charset: "utf8", comment: "Klarna Payments Quote", force: :cascade do |t|
    t.string "session_id", comment: "Klarna Session Id"
    t.text "client_token", comment: "Klarna Client Token"
    t.string "authorization_token", comment: "Authorization Token"
    t.integer "is_active", limit: 2, default: 0, null: false, comment: "Is Active"
    t.integer "quote_id", null: false, comment: "Quote Id", unsigned: true
    t.string "payment_methods", comment: "Payment Method Categories"
    t.text "payment_method_info", comment: "Payment Method Category Info"
    t.index ["quote_id"], name: "KLARNA_PAYMENTS_QUOTE_QUOTE_ID"
  end

  create_table "layout_link", primary_key: "layout_link_id", id: { type: :integer, comment: "Link ID", unsigned: true }, charset: "utf8", comment: "Layout Link", force: :cascade do |t|
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "theme_id", null: false, comment: "Theme ID", unsigned: true
    t.integer "layout_update_id", default: 0, null: false, comment: "Layout Update ID", unsigned: true
    t.boolean "is_temporary", default: false, null: false, comment: "Defines whether Layout Update is Temporary"
    t.index ["layout_update_id"], name: "LAYOUT_LINK_LAYOUT_UPDATE_ID"
    t.index ["store_id", "theme_id", "layout_update_id", "is_temporary"], name: "LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY"
    t.index ["theme_id"], name: "LAYOUT_LINK_THEME_ID_THEME_THEME_ID"
  end

  create_table "layout_update", primary_key: "layout_update_id", id: { type: :integer, comment: "Layout Update ID", unsigned: true }, charset: "utf8", comment: "Layout Updates", force: :cascade do |t|
    t.string "handle", comment: "Handle"
    t.text "xml", comment: "Xml"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order"
    t.timestamp "updated_at", comment: "Last Update Timestamp"
    t.index ["handle"], name: "LAYOUT_UPDATE_HANDLE"
  end

  create_table "login_as_customer", primary_key: "secret", id: { type: :string, limit: 64, comment: "Login Secret" }, charset: "utf8", comment: "Magento Login as Customer Table", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer ID"
    t.integer "admin_id", null: false, comment: "Admin ID"
    t.timestamp "created_at", comment: "Creation Time"
    t.index ["created_at"], name: "LOGIN_AS_CUSTOMER_CREATED_AT"
  end

  create_table "login_as_customer_assistance_allowed", id: false, charset: "utf8", comment: "Magento Login as Customer Assistance Allowed Table", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.index ["customer_id"], name: "LOGIN_AS_CUSTOMER_ASSISTANCE_ALLOWED_CUSTOMER_ID", unique: true
  end

  create_table "magefan_blog_category", primary_key: "category_id", id: { type: :integer, comment: "Category ID" }, charset: "utf8", comment: "Magefan Blog Category Table", force: :cascade do |t|
    t.string "title", comment: "Category Title"
    t.string "meta_title", comment: "Category Meta Title"
    t.text "meta_keywords", comment: "Category Meta Keywords"
    t.text "meta_description", comment: "Category Meta Description"
    t.string "identifier", limit: 100, comment: "Category String Identifier"
    t.string "content_heading", comment: "Category Content Heading"
    t.text "content", size: :medium, comment: "Category Content"
    t.string "path", comment: "Category Path"
    t.integer "position", limit: 2, null: false, comment: "Category Position"
    t.integer "posts_sort_by", limit: 2, default: 0, null: false, comment: "Post Sort By"
    t.integer "include_in_menu", limit: 2, comment: "Category In Menu"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Category Active"
    t.integer "display_mode", limit: 2, default: 0, null: false, comment: "Display Mode"
    t.string "page_layout", comment: "Post Layout"
    t.text "layout_update_xml", comment: "Post Layout Update Content"
    t.string "custom_theme", limit: 100, comment: "Post Custom Theme"
    t.string "custom_layout", comment: "Post Custom Template"
    t.text "custom_layout_update_xml", comment: "Post Custom Layout Update Content"
    t.date "custom_theme_from", comment: "Post Custom Theme Active From Date"
    t.date "custom_theme_to", comment: "Post Custom Theme Active To Date"
    t.index ["identifier"], name: "MAGEFAN_BLOG_CATEGORY_IDENTIFIER"
    t.index ["include_in_menu"], name: "MAGEFAN_BLOG_CATEGORY_INCLUDE_IN_MENU"
    t.index ["title", "meta_keywords", "meta_description", "identifier", "content"], name: "FTI_B76AD11A0A06CC3327BA3A86A016134F", type: :fulltext
  end

  create_table "magefan_blog_category_store", primary_key: ["category_id", "store_id"], charset: "utf8", comment: "Magefan Blog Category To Store Linkage Table", force: :cascade do |t|
    t.integer "category_id", null: false, comment: "Category ID"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "MAGEFAN_BLOG_CATEGORY_STORE_STORE_ID"
  end

  create_table "magefan_blog_comment", primary_key: "comment_id", id: { type: :integer, comment: "Comment ID" }, charset: "utf8", comment: "magefan_blog_comment", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent Comment ID"
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "customer_id", comment: "Customer ID"
    t.integer "admin_id", comment: "Admin User ID"
    t.integer "status", limit: 2, null: false, comment: "Comment status"
    t.integer "author_type", limit: 2, null: false, comment: "Author Type"
    t.string "author_nickname", null: false, comment: "Comment Author Nickname"
    t.string "author_email", comment: "Comment Author Email"
    t.text "text", size: :medium, comment: "Text"
    t.timestamp "creation_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Comment Creation Time"
    t.timestamp "update_time", null: false, comment: "Comment Update Time"
    t.index ["admin_id"], name: "MAGEFAN_BLOG_COMMENT_ADMIN_ID"
    t.index ["customer_id"], name: "MAGEFAN_BLOG_COMMENT_CUSTOMER_ID"
    t.index ["parent_id"], name: "MAGEFAN_BLOG_COMMENT_PARENT_ID"
    t.index ["post_id"], name: "MAGEFAN_BLOG_COMMENT_POST_ID"
    t.index ["status"], name: "MAGEFAN_BLOG_COMMENT_STATUS"
  end

  create_table "magefan_blog_post", primary_key: "post_id", id: { type: :integer, comment: "Post ID" }, charset: "utf8", comment: "Magefan Blog Post Table", force: :cascade do |t|
    t.string "title", comment: "Post Title"
    t.string "meta_title", comment: "Post Meta Title"
    t.text "meta_keywords", comment: "Post Meta Keywords"
    t.text "meta_description", comment: "Post Meta Description"
    t.string "identifier", limit: 100, comment: "Post String Identifier"
    t.string "og_title", comment: "Post OG Title"
    t.string "og_description", comment: "Post OG Description"
    t.string "og_img", comment: "Post OG Img"
    t.string "og_type", comment: "Post OG Type"
    t.string "content_heading", comment: "Post Content Heading"
    t.text "content", size: :medium, comment: "Post Content"
    t.timestamp "creation_time", comment: "Post Creation Time"
    t.timestamp "update_time", comment: "Post Modification Time"
    t.timestamp "publish_time", comment: "Post Publish Time"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Post Active"
    t.integer "include_in_recent", limit: 2, default: 1, null: false, comment: "Include in Recent Posts"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Position"
    t.string "featured_img", comment: "Thumbnail Image"
    t.string "featured_img_alt", comment: "Featured Image Alt"
    t.integer "author_id", comment: "Author ID"
    t.string "page_layout", comment: "Post Layout"
    t.text "layout_update_xml", comment: "Post Layout Update Content"
    t.string "custom_theme", limit: 100, comment: "Post Custom Theme"
    t.string "custom_layout", comment: "Post Custom Template"
    t.text "custom_layout_update_xml", comment: "Post Custom Layout Update Content"
    t.date "custom_theme_from", comment: "Post Custom Theme Active From Date"
    t.date "custom_theme_to", comment: "Post Custom Theme Active To Date"
    t.text "media_gallery", size: :medium, comment: "Media Gallery"
    t.string "secret", limit: 32, comment: "Post Secret"
    t.integer "views_count", comment: "Post Views Count"
    t.integer "is_recent_posts_skip", limit: 2, comment: "Is Post Skipped From Recent Posts"
    t.text "short_content", size: :medium, comment: "Post Short Content"
    t.integer "comments_count", comment: "Post Comment Counts"
    t.index ["author_id"], name: "MAGEFAN_BLOG_POST_AUTHOR_ID"
    t.index ["identifier"], name: "MAGEFAN_BLOG_POST_IDENTIFIER"
    t.index ["is_recent_posts_skip"], name: "MAGEFAN_BLOG_POST_IS_RECENT_POSTS_SKIP"
    t.index ["title", "meta_keywords", "meta_description", "identifier", "content"], name: "FTI_A5DB7871E89B230F74EDFBECEB4659FA", type: :fulltext
    t.index ["views_count"], name: "MAGEFAN_BLOG_POST_VIEWS_COUNT"
  end

  create_table "magefan_blog_post_category", primary_key: ["post_id", "category_id"], charset: "utf8", comment: "Magefan Blog Post To Category Linkage Table", force: :cascade do |t|
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "category_id", null: false, comment: "Category ID"
    t.index ["category_id"], name: "MAGEFAN_BLOG_POST_CATEGORY_CATEGORY_ID"
  end

  create_table "magefan_blog_post_relatedpost", primary_key: ["post_id", "related_id"], charset: "utf8", comment: "Magefan Blog Post To Post Linkage Table", force: :cascade do |t|
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "related_id", null: false, comment: "Related Post ID"
    t.integer "position", null: false, comment: "Position"
    t.index ["related_id"], name: "MAGEFAN_BLOG_POST_RELATEDPRODUCT_RELATED_ID"
  end

  create_table "magefan_blog_post_relatedproduct", primary_key: ["post_id", "related_id"], charset: "utf8", comment: "Magefan Blog Post To Product Linkage Table", force: :cascade do |t|
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "related_id", null: false, comment: "Related Product ID", unsigned: true
    t.integer "position", null: false, comment: "Position"
    t.index ["related_id"], name: "MAGEFAN_BLOG_POST_RELATEDPRODUCT_RELATED_ID"
  end

  create_table "magefan_blog_post_store", primary_key: ["post_id", "store_id"], charset: "utf8", comment: "Magefan Blog Post To Store Linkage Table", force: :cascade do |t|
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "MAGEFAN_BLOG_POST_STORE_STORE_ID"
  end

  create_table "magefan_blog_post_tag", primary_key: ["post_id", "tag_id"], charset: "utf8", comment: "Magefan Blog Post To Category Linkage Table", force: :cascade do |t|
    t.integer "post_id", null: false, comment: "Post ID"
    t.integer "tag_id", null: false, comment: "Tag ID"
    t.index ["tag_id"], name: "MAGEFAN_BLOG_POST_TAG_TAG_ID"
  end

  create_table "magefan_blog_tag", primary_key: "tag_id", id: { type: :integer, comment: "Tag ID" }, charset: "utf8", comment: "Magefan Blog Tag Table", force: :cascade do |t|
    t.string "title", comment: "Tag Title"
    t.string "meta_robots", comment: "Tag Degault Robots"
    t.string "meta_description", comment: "Tag Meta Description"
    t.string "meta_keywords", comment: "Tag Meta Keywords"
    t.string "meta_title", comment: "Tag Meta Title"
    t.string "identifier", limit: 100, comment: "Tag String Identifier"
    t.string "page_layout", comment: "Tag Layout"
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Is Tag Active"
    t.text "content", size: :medium, comment: "Tag Content"
    t.text "layout_update_xml", comment: "Tag Layout Update Content"
    t.string "custom_theme", limit: 100, comment: "Tag Custom Theme"
    t.string "custom_layout", comment: "Tag Custom Template"
    t.text "custom_layout_update_xml", comment: "Tag Custom Layout Update Content"
    t.date "custom_theme_from", comment: "Tag Custom Theme Active From Date"
    t.date "custom_theme_to", comment: "Tag Custom Theme Active To Date"
    t.index ["identifier"], name: "MAGEFAN_BLOG_TAG_IDENTIFIER"
    t.index ["is_active"], name: "MAGEFAN_BLOG_TAG_IS_ACTIVE"
  end

  create_table "magento_acknowledged_bulk", id: { type: :integer, comment: "Internal ID", unsigned: true }, charset: "utf8", comment: "Bulk that was viewed by user from notification area", force: :cascade do |t|
    t.binary "bulk_uuid", limit: 39, comment: "Related Bulk UUID"
    t.index ["bulk_uuid"], name: "MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID", unique: true
  end

  create_table "magento_bulk", id: { type: :integer, comment: "Bulk Internal ID (must not be exposed)", unsigned: true }, charset: "utf8", comment: "Bulk entity that represents set of related asynchronous operations", force: :cascade do |t|
    t.binary "uuid", limit: 39, comment: "Bulk UUID (can be exposed to reference bulk entity)"
    t.integer "user_id", comment: "ID of the WebAPI user that performed an action", unsigned: true
    t.integer "user_type", comment: "Which type of user"
    t.string "description", comment: "Bulk Description"
    t.integer "operation_count", null: false, comment: "Total number of operations scheduled within this bulk", unsigned: true
    t.timestamp "start_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Bulk start time"
    t.index ["user_id"], name: "MAGENTO_BULK_USER_ID"
    t.index ["uuid"], name: "MAGENTO_BULK_UUID", unique: true
  end

  create_table "magento_login_as_customer_log", primary_key: "log_id", id: { type: :integer, comment: "Log Id" }, charset: "utf8", comment: "Login as Customer Logging", force: :cascade do |t|
    t.timestamp "time", comment: "Event Date"
    t.integer "user_id", comment: "User Id", unsigned: true
    t.string "user_name", limit: 40, comment: "User Name"
    t.integer "customer_id", comment: "Customer Id", unsigned: true
    t.string "customer_email", limit: 40, comment: "Customer email"
    t.index ["user_id"], name: "MAGENTO_LOGIN_AS_CUSTOMER_LOG_USER_ID"
  end

  create_table "magento_operation", id: { type: :integer, comment: "Operation ID", unsigned: true }, charset: "utf8", comment: "Operation entity", force: :cascade do |t|
    t.binary "bulk_uuid", limit: 39, comment: "Related Bulk UUID"
    t.string "topic_name", comment: "Name of the related message queue topic"
    t.binary "serialized_data", comment: "Data (serialized) required to perform an operation"
    t.binary "result_serialized_data", comment: "Result data (serialized) after perform an operation"
    t.integer "status", limit: 2, default: 0, comment: "Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)"
    t.integer "error_code", limit: 2, comment: "Code of the error that appeared during operation execution (used to aggregate related failed operations)"
    t.string "result_message", comment: "Operation result message"
    t.integer "operation_key", null: false, comment: "Operation Key", unsigned: true
    t.index ["bulk_uuid", "error_code"], name: "MAGENTO_OPERATION_BULK_UUID_ERROR_CODE"
  end

  create_table "mageplaza_bannerslider_banner", primary_key: "banner_id", id: { type: :integer, comment: "Banner ID", unsigned: true }, charset: "utf8", comment: "Banner Table", force: :cascade do |t|
    t.string "name", comment: "Banner Name"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.integer "type", limit: 2, default: 0, null: false, comment: "Banner Type"
    t.text "content", comment: "Custom html, css"
    t.string "image", comment: "Banner Image"
    t.string "url_banner", comment: "Banner Url"
    t.string "title", comment: "Title"
    t.integer "newtab", limit: 2, default: 1, null: false, comment: "Open tab"
    t.timestamp "created_at", comment: "Banner Created At"
    t.timestamp "updated_at", comment: "Banner Updated At"
    t.string "mobile_image", comment: "Mobile Image"
    t.string "banner_item_type", comment: "Banner Item Type"
    t.integer "item_id", comment: "Item ID"
    t.index ["name", "image", "url_banner"], name: "MAGEPLAZA_BANNERSLIDER_BANNER_NAME_IMAGE_URL_BANNER", type: :fulltext
  end

  create_table "mageplaza_bannerslider_banner_slider", primary_key: ["slider_id", "banner_id"], charset: "utf8", comment: "Slider To Banner Link Table", force: :cascade do |t|
    t.integer "slider_id", null: false, comment: "Slider ID", unsigned: true
    t.integer "banner_id", null: false, comment: "Banner ID", unsigned: true
    t.integer "position", default: 0, null: false, comment: "Position"
    t.index ["banner_id"], name: "MAGEPLAZA_BANNERSLIDER_BANNER_SLIDER_BANNER_ID"
    t.index ["slider_id", "banner_id"], name: "MAGEPLAZA_BANNERSLIDER_BANNER_SLIDER_SLIDER_ID_BANNER_ID", unique: true
    t.index ["slider_id"], name: "MAGEPLAZA_BANNERSLIDER_BANNER_SLIDER_SLIDER_ID"
  end

  create_table "mageplaza_bannerslider_slider", primary_key: "slider_id", id: { type: :integer, comment: "Slider ID", unsigned: true }, charset: "utf8", comment: "Slider Table", force: :cascade do |t|
    t.string "name", comment: "Slider Name"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.text "location", comment: "Location"
    t.string "store_ids", comment: "Store_ids"
    t.string "customer_group_ids", comment: "Customer_group_ids"
    t.integer "priority", default: 0, null: false, comment: "Priority", unsigned: true
    t.string "effect", comment: "Animation effect"
    t.integer "autoWidth", limit: 2, comment: "Auto Width"
    t.integer "autoHeight", limit: 2, comment: "Auto Height"
    t.integer "design", limit: 2, default: 0, null: false, comment: "Design"
    t.integer "loop", limit: 2, comment: "Loop slider"
    t.integer "lazyLoad", limit: 2, comment: "Lazyload image"
    t.integer "autoplay", limit: 2, comment: "Autoplay"
    t.string "autoplayTimeout", default: "5000", comment: "autoplay Timeout"
    t.integer "nav", limit: 2, comment: "Navigation"
    t.integer "dots", limit: 2, comment: "Dots"
    t.integer "is_responsive", limit: 2, comment: "Responsive"
    t.string "responsive_items", comment: "Max Items Slider"
    t.date "from_date", comment: "From"
    t.date "to_date", comment: "To"
    t.timestamp "created_at", comment: "Slider Created At"
    t.timestamp "updated_at", comment: "Slider Updated At"
  end

  create_table "mageplaza_smtp_abandonedcart", id: { type: :integer, comment: "Log Id", unsigned: true }, charset: "utf8", comment: "SMTP Abandoned Cart", force: :cascade do |t|
    t.string "log_ids", comment: "Log Ids"
    t.string "token", comment: "Token"
    t.integer "quote_id", default: 0, null: false, comment: "Quote Id", unsigned: true
    t.integer "status", limit: 2, null: false, comment: "Status"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, comment: "Created At"
    t.index ["quote_id"], name: "MAGEPLAZA_SMTP_ABANDONEDCART_QUOTE_ID_QUOTE_ENTITY_ID"
  end

  create_table "mageplaza_smtp_log", id: { type: :integer, comment: "Log ID", unsigned: true }, charset: "utf8", comment: "mageplaza_smtp_log", force: :cascade do |t|
    t.string "subject", comment: "Email Subject"
    t.text "email_content", comment: "Email Content"
    t.integer "status", limit: 2, null: false, comment: "Status"
    t.timestamp "created_at", comment: "Created At"
    t.string "sender", comment: "Sender"
    t.string "recipient", comment: "Recipient"
    t.string "cc", comment: "Cc"
    t.string "bcc", comment: "Bcc"
    t.index ["status"], name: "MAGEPLAZA_SMTP_LOG_STATUS"
  end

  create_table "magiccart_lookbook", primary_key: "lookbook_id", id: { type: :integer, comment: "Lookbook ID" }, charset: "utf8", comment: "Magiccart Lookbook", force: :cascade do |t|
    t.string "title", comment: "Title"
    t.string "identifier", comment: "Identifier"
    t.integer "type_id", limit: 2, default: 1, null: false, comment: "Type"
    t.string "link", comment: "Link"
    t.string "image", comment: "Image"
    t.text "options", comment: "options"
    t.string "stores", comment: "Stores"
    t.integer "order", default: 0, null: false, comment: "Order"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
  end

  create_table "magiccart_magicmenu", primary_key: "magicmenu_id", id: { type: :integer, comment: "Magicmenu ID" }, charset: "utf8", comment: "Magiccart Magicmenu", force: :cascade do |t|
    t.string "cat_id", comment: "Category Id"
    t.string "cat_col", comment: "Columns category"
    t.integer "cat_proportion", default: 0, null: false, comment: "Proportion category"
    t.string "top", comment: "Category content top"
    t.string "right", comment: "Category content right"
    t.integer "right_proportion", default: 0, null: false, comment: "Proportion category content right"
    t.string "bottom", comment: "Category content bottom"
    t.string "left", comment: "Category content right"
    t.integer "left_proportion", default: 0, null: false, comment: "Proportion category content left"
    t.string "name", comment: "Extra menu name"
    t.string "magic_label", comment: "Extra menu label"
    t.string "link", comment: "Extra menu link"
    t.text "ext_content", comment: "Extra menu content"
    t.integer "extra", limit: 2, default: 0, null: false, comment: "Is Extra"
    t.string "stores", comment: "Stores"
    t.integer "order", default: 0, null: false, comment: "Order"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
  end

  create_table "magiccart_magicproduct", primary_key: "magicproduct_id", id: { type: :integer, comment: "Magicproduct ID" }, charset: "utf8", comment: "Magiccart Magicproduct", force: :cascade do |t|
    t.string "title", null: false, comment: "Title"
    t.string "identifier", comment: "Identifier"
    t.integer "type_id", limit: 2, default: 1, null: false, comment: "Type"
    t.text "config", size: :medium, comment: "Config"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.index ["identifier"], name: "MAGICPRODUCT_IDENTIFIER_IDENTIFIER"
  end

  create_table "magiccart_magicslider", primary_key: "magicslider_id", id: { type: :integer, comment: "Magicslider ID" }, charset: "utf8", comment: "Magiccart Magicslider", force: :cascade do |t|
    t.string "title", null: false, comment: "Title"
    t.string "identifier", comment: "Identifier"
    t.text "config", size: :medium, comment: "Config"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.datetime "created_time", comment: "Created Time"
    t.datetime "update_time", comment: "Update Time"
    t.string "stores", default: "0", null: false, comment: "Stores"
    t.index ["magicslider_id"], name: "MAGICSLIDER_ID_MAGICSLIDER_ID"
  end

  create_table "magiccart_shopbrand", primary_key: "shopbrand_id", id: { type: :integer, comment: "Brand ID" }, charset: "utf8", comment: "Magiccart Shopbrand", force: :cascade do |t|
    t.string "title", null: false, comment: "Title"
    t.string "urlkey", comment: "Urlkey"
    t.string "meta_key", comment: "Meta_key"
    t.string "meta_description", comment: "Meta_description"
    t.string "option_id", comment: "Option_id"
    t.string "image", comment: "Image"
    t.text "product_ids", size: :medium, comment: "product_ids"
    t.string "stores", comment: "Stores"
    t.string "description", comment: "Description"
    t.integer "order", limit: 2, default: 0, null: false, comment: "Order"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.integer "is_featured", limit: 2, default: 0, comment: "Is Featured"
    t.datetime "flash_sale_start_date", null: false, comment: "Flash Start Date"
    t.datetime "flash_sale_end_date", null: false, comment: "Flash End Date"
    t.index ["shopbrand_id"], name: "SHOPBRAND_ID_SHOPBRAND_ID"
  end

  create_table "magiccart_testimonial", primary_key: "testimonial_id", id: { type: :integer, comment: "Testimonial ID" }, charset: "utf8", comment: "Magiccart Testimonial", force: :cascade do |t|
    t.string "name", null: false, comment: "Name"
    t.string "image", comment: "Image"
    t.text "text", size: :medium, comment: "product_ids"
    t.string "company", comment: "Company"
    t.string "job", comment: "Job"
    t.string "email", comment: "Email"
    t.string "website", comment: "Website"
    t.integer "rating_summary", limit: 2, default: 5, null: false, comment: "Rating Summary"
    t.string "stores", default: "0", comment: "Stores"
    t.integer "order", limit: 2, default: 0, null: false, comment: "Order"
    t.integer "status", limit: 2, default: 1, null: false, comment: "Status"
    t.datetime "created_time", comment: "Created Time"
    t.datetime "update_time", comment: "Update Time"
    t.index ["testimonial_id"], name: "TESTIMONIAL_ID_TESTIMONIAL_ID"
  end

  create_table "marketplace_controller_list", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Controller List Table", force: :cascade do |t|
    t.text "module_name", comment: "Webkul Module Name"
    t.text "controller_path", comment: "Controller Path"
    t.text "label", comment: "Controller Label"
    t.integer "is_child", limit: 2, default: 0, null: false, comment: "Is controller have any child Option"
    t.integer "parent_id", default: 0, null: false, comment: "Parent Id", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
  end

  create_table "marketplace_datafeedback", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Feedback Table", force: :cascade do |t|
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.integer "buyer_id", default: 0, null: false, comment: "Buyer Id", unsigned: true
    t.string "buyer_email", comment: "Buyer Email"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
    t.integer "feed_price", limit: 2, default: 0, null: false, comment: "Feed Price", unsigned: true
    t.integer "feed_value", limit: 2, default: 0, null: false, comment: "Feed Value", unsigned: true
    t.integer "feed_quality", limit: 2, default: 0, null: false, comment: "Feed Quality", unsigned: true
    t.string "feed_nickname", comment: "Feed Nickname"
    t.text "feed_summary", comment: "Summary"
    t.text "feed_review", comment: "Review"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "seller_pending_notification", limit: 2, default: 0, null: false, comment: "Notification flag for review", unsigned: true
    t.integer "admin_notification", limit: 2, default: 0, null: false, comment: "Notification flag for admin", unsigned: true
    t.index ["seller_id"], name: "MARKETPLACE_DATAFEEDBACK_SELLER_ID"
  end

  create_table "marketplace_feedbackcount", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Feedbackcount Table", force: :cascade do |t|
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.integer "buyer_id", default: 0, null: false, comment: "Buyer Id", unsigned: true
    t.integer "order_count", default: 0, null: false, comment: "Order Count", unsigned: true
    t.integer "feedback_count", default: 0, null: false, comment: "Feedback Count", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.index ["seller_id"], name: "MARKETPLACE_FEEDBACKCOUNT_SELLER_ID"
  end

  create_table "marketplace_notification_list", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Notification List Table", force: :cascade do |t|
    t.integer "notification_id", null: false, comment: "Notification Id", unsigned: true
    t.integer "notification_row_id", default: 0, null: false, comment: "Contains Id of product order transaction as per type ", unsigned: true
    t.integer "type", null: false, comment: "Notification Type", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
  end

  create_table "marketplace_order_pendingemails", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Order Pending Email Table", force: :cascade do |t|
    t.integer "seller_id", null: false, comment: "Seller Id", unsigned: true
    t.integer "order_id", null: false, comment: "Order Id", unsigned: true
    t.text "myvar1", comment: "myvar1"
    t.text "myvar2", comment: "myvar2"
    t.text "myvar3", comment: "myvar3"
    t.text "myvar4", comment: "myvar4"
    t.text "myvar5", comment: "myvar5"
    t.text "myvar6", comment: "myvar6"
    t.text "myvar8", comment: "myvar8"
    t.text "myvar9", comment: "myvar9"
    t.text "isNotVirtual", comment: "isNotVirtual"
    t.text "sender_name", comment: "sender_name"
    t.text "sender_email", comment: "sender_email"
    t.text "receiver_name", comment: "receiver_name"
    t.text "receiver_email", comment: "receiver_email"
    t.integer "status", default: 0, null: false, comment: "Status"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
  end

  create_table "marketplace_orders", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Orders Table", force: :cascade do |t|
    t.integer "order_id", default: 0, null: false, comment: "Magento Order Id", unsigned: true
    t.string "product_ids", comment: "Order Product Ids"
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.string "shipment_id", default: "0", null: false, comment: "Shipment Id"
    t.string "invoice_id", default: "0", null: false, comment: "Invoice Id"
    t.string "creditmemo_id", default: "0", null: false, comment: "Creditmemo Id"
    t.integer "is_canceled", default: 0, null: false, comment: "Canceled Status", unsigned: true
    t.decimal "shipping_charges", precision: 12, scale: 4, default: "0.0", null: false, comment: "Shipping Charges"
    t.string "carrier_name", comment: "Carrier Name"
    t.string "tracking_number", comment: "Tracking Number"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "tax_to_seller", limit: 2, default: 0, null: false, comment: "Tax to seller account flag", unsigned: true
    t.decimal "total_tax", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Tax"
    t.decimal "coupon_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Coupon Amount"
    t.decimal "refunded_coupon_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Refunded Coupon Amount"
    t.decimal "refunded_shipping_charges", precision: 12, scale: 4, default: "0.0", null: false, comment: "Refunded Shipping Amount"
    t.integer "seller_pending_notification", limit: 2, default: 0, null: false, comment: "Order Notification flag for sellers", unsigned: true
    t.string "order_status", limit: 32, default: "pending", null: false, comment: "Order Status"
    t.index ["order_id"], name: "MARKETPLACE_ORDERS_ORDER_ID"
  end

  create_table "marketplace_product", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Product Table", force: :cascade do |t|
    t.integer "mageproduct_id", default: 0, null: false, comment: "Magento Product Id", unsigned: true
    t.integer "adminassign", default: 0, null: false, comment: "Admin Assign Id", unsigned: true
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.integer "store_id", default: 0, null: false, comment: "Store Id", unsigned: true
    t.integer "status", default: 0, null: false, comment: "Status", unsigned: true
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "seller_pending_notification", limit: 2, default: 0, null: false, comment: "Product Notification flag for sellers", unsigned: true
    t.integer "admin_pending_notification", limit: 2, default: 0, null: false, comment: "Product Notification flag for admin", unsigned: true
    t.integer "is_approved", limit: 2, default: 0, null: false, comment: "Is product approve by admin for the first time", unsigned: true
    t.index ["mageproduct_id"], name: "MARKETPLACE_PRODUCT_MAGEPRODUCT_ID"
  end

  create_table "marketplace_productflag_reason", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Product Flag Reason Table", force: :cascade do |t|
    t.text "reason", comment: "Flag Reason"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
  end

  create_table "marketplace_productflags", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Seller Flag Table", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false, comment: "Product Id", unsigned: true
    t.text "name", comment: "Reporter Name"
    t.text "email", comment: "Reporter Email"
    t.text "reason", comment: "Flag Reason"
    t.timestamp "created_at", comment: "Creation Time"
    t.index ["product_id"], name: "MARKETPLACE_PRODUCTFLAGS_PRODUCT_ID"
  end

  create_table "marketplace_saleperpartner", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace sales Per Seller Table", force: :cascade do |t|
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.decimal "total_sale", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Sale"
    t.decimal "amount_received", precision: 12, scale: 4, default: "0.0", null: false, comment: "Received Amount"
    t.decimal "last_amount_paid", precision: 12, scale: 4, default: "0.0", null: false, comment: "Last Paid amount"
    t.decimal "amount_remain", precision: 12, scale: 4, default: "0.0", null: false, comment: "Remaining Amount"
    t.decimal "total_commission", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Commission Amount"
    t.decimal "commission_rate", precision: 12, scale: 4, comment: "Commission Rate"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.decimal "min_order_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Min Order Amount"
    t.integer "min_order_status", limit: 2, default: 0, null: false, comment: "Minimum Order Amount Status", unsigned: true
    t.integer "commission_status", limit: 2, default: 0, null: false, comment: "Commission Status", unsigned: true
    t.text "analytic_id", comment: "Google Analytic Id"
  end

  create_table "marketplace_saleslist", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Saleslist Table", force: :cascade do |t|
    t.integer "mageproduct_id", default: 0, null: false, comment: "Magento Product Id", unsigned: true
    t.integer "order_id", default: 0, null: false, comment: "Magento Order Id", unsigned: true
    t.integer "order_item_id", default: 0, null: false, comment: "Magento Order Item Id", unsigned: true
    t.integer "parent_item_id", comment: "Magento Order Parent Item Id", unsigned: true
    t.string "magerealorder_id", comment: "Order Increment Id"
    t.string "magequantity", comment: "Quantity"
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.integer "trans_id", default: 0, null: false, comment: "Transaction Id", unsigned: true
    t.integer "cpprostatus", default: 0, null: false, comment: "Seller Order Status", unsigned: true
    t.integer "paid_status", default: 0, null: false, comment: "Seller Order Paid Status", unsigned: true
    t.integer "magebuyer_id", default: 0, null: false, comment: "Buyer Id", unsigned: true
    t.string "magepro_name", comment: "Product Name"
    t.decimal "magepro_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.decimal "total_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Amount"
    t.decimal "total_tax", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Tax"
    t.decimal "total_commission", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Commission"
    t.decimal "actual_seller_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Actual Seller Amount"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "is_shipping", limit: 2, default: 0, null: false, comment: "Is Shipping Applied", unsigned: true
    t.integer "is_coupon", limit: 2, default: 0, null: false, comment: "Is Coupon Applied", unsigned: true
    t.integer "is_paid", limit: 2, default: 0, null: false, comment: "Is Seller Paid For Current Row", unsigned: true
    t.decimal "commission_rate", precision: 12, scale: 4, default: "0.0", null: false, comment: "Commission Rate Applied At The Time Of Order Placed"
    t.decimal "currency_rate", precision: 12, scale: 4, default: "1.0", null: false, comment: "Ordered Currency Rate"
    t.decimal "applied_coupon_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Applied Coupon Amount At The Time Of Order Placed"
    t.integer "is_withdrawal_requested", limit: 2, default: 0, null: false, comment: "Is Is Withdrawal Requested ", unsigned: true
    t.index ["order_id"], name: "MARKETPLACE_SALESLIST_ORDER_ID"
  end

  create_table "marketplace_sellerflag_reason", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Seller Flag Reason Table", force: :cascade do |t|
    t.text "reason", comment: "Flag Reason"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "status", limit: 2, default: 0, null: false, comment: "Status", unsigned: true
  end

  create_table "marketplace_sellerflags", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Seller Flag Table", force: :cascade do |t|
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.text "name", comment: "Reporter Name"
    t.text "email", comment: "Reporter Email"
    t.text "reason", comment: "Flag Reason"
    t.timestamp "created_at", comment: "Creation Time"
    t.index ["seller_id"], name: "MARKETPLACE_SELLERFLAGS_SELLER_ID"
  end

  create_table "marketplace_sellertransaction", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Transaction Table", force: :cascade do |t|
    t.string "transaction_id", comment: "Transaction Id"
    t.string "onlinetr_id", comment: "Online Transaction Id"
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.decimal "transaction_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Transaction Amount"
    t.string "type", comment: "Payment Type"
    t.string "method", comment: "Payment Method"
    t.text "custom_note", comment: "Custom Note"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "seller_pending_notification", limit: 2, default: 0, null: false, comment: "Notification flag for sellers", unsigned: true
    t.index ["seller_id"], name: "MARKETPLACE_SELLERTRANSACTION_SELLER_ID"
  end

  create_table "marketplace_userdata", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Marketplace Product Table", force: :cascade do |t|
    t.integer "is_seller", default: 0, null: false, comment: "Is Seller?", unsigned: true
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.text "payment_source", comment: "Seller Payment Source"
    t.string "twitter_id", comment: "Twitter Id"
    t.string "facebook_id", comment: "Facebook Id"
    t.string "gplus_id", comment: "Google Plus Id"
    t.string "youtube_id", comment: "Youtube Id"
    t.string "vimeo_id", comment: "Vimeo Id"
    t.string "instagram_id", comment: "Instagram Id"
    t.string "pinterest_id", comment: "Pinterest Id"
    t.string "moleskine_id", comment: "Moleskine Id"
    t.integer "tw_active", default: 0, null: false, comment: "Twitter Active Status", unsigned: true
    t.integer "fb_active", default: 0, null: false, comment: "Facebook Active Status", unsigned: true
    t.integer "gplus_active", default: 0, null: false, comment: "Google+ Active Status", unsigned: true
    t.integer "youtube_active", default: 0, null: false, comment: "Youtube Active Status", unsigned: true
    t.integer "vimeo_active", default: 0, null: false, comment: "Vimeo Active Status", unsigned: true
    t.integer "instagram_active", default: 0, null: false, comment: "Instagram Active Status", unsigned: true
    t.integer "pinterest_active", default: 0, null: false, comment: "Pinterest Active Status", unsigned: true
    t.integer "moleskine_active", default: 0, null: false, comment: "Moleskine Active Status", unsigned: true
    t.text "others_info", comment: "Others Info"
    t.text "banner_pic", comment: "Banner Image"
    t.text "shop_url", comment: "Shop Url"
    t.text "shop_title", comment: "Shop Title"
    t.text "logo_pic", comment: "Logo Image"
    t.text "company_locality", comment: "Company Locality"
    t.text "country_pic", comment: "Country Flag Image"
    t.text "company_description", comment: "Company Description"
    t.text "meta_keyword", comment: "Meta Keyword"
    t.text "meta_description", comment: "Meta Description"
    t.text "background_width", comment: "Background Width"
    t.integer "store_id", default: 0, null: false, comment: "Store Id", unsigned: true
    t.string "contact_number", limit: 50, comment: "Contact Number"
    t.text "return_policy", comment: "Return Policy"
    t.text "shipping_policy", comment: "Shipping Policy"
    t.timestamp "created_at", comment: "Creation Time"
    t.timestamp "updated_at", comment: "Update Time"
    t.integer "admin_notification", limit: 2, default: 0, null: false, comment: "Notification flag for admin", unsigned: true
    t.text "privacy_policy", comment: "Privacy Policy"
    t.text "allowed_categories", null: false, comment: "Allowed Categories Ids"
  end

  create_table "media_content_asset", primary_key: ["entity_type", "entity_id", "field", "asset_id"], charset: "utf8", comment: "Relation between media content and media asset", force: :cascade do |t|
    t.integer "asset_id", null: false, comment: "Entity ID", unsigned: true
    t.string "entity_type", null: false, comment: "Content type"
    t.string "entity_id", null: false, comment: "Content entity id"
    t.string "field", null: false, comment: "Content field"
    t.index ["asset_id"], name: "MEDIA_CONTENT_ASSET_ASSET_ID"
  end

  create_table "media_gallery_asset", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Media Gallery Asset", force: :cascade do |t|
    t.text "path", comment: "Path"
    t.string "title", comment: "Title"
    t.string "source", comment: "Source"
    t.string "content_type", comment: "Content Type"
    t.integer "width", default: 0, null: false, comment: "Width", unsigned: true
    t.integer "height", default: 0, null: false, comment: "Height", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.text "description", comment: "Description"
    t.string "hash", comment: "File hash"
    t.integer "size", null: false, comment: "Asset file size in bytes", unsigned: true
    t.index ["id"], name: "MEDIA_GALLERY_ASSET_ID"
    t.index ["title"], name: "MEDIA_GALLERY_ASSET_TITLE", type: :fulltext
  end

  create_table "media_gallery_asset_keyword", primary_key: ["keyword_id", "asset_id"], charset: "utf8", comment: "Media Gallery Asset Keyword", force: :cascade do |t|
    t.integer "keyword_id", null: false, comment: "Keyword Id", unsigned: true
    t.integer "asset_id", null: false, comment: "Asset ID", unsigned: true
    t.index ["asset_id"], name: "MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID"
    t.index ["keyword_id"], name: "MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID"
  end

  create_table "media_gallery_keyword", id: { type: :integer, comment: "Keyword ID", unsigned: true }, charset: "utf8", comment: "Media Gallery Keyword", force: :cascade do |t|
    t.string "keyword", null: false, comment: "Keyword"
    t.index ["id"], name: "MEDIA_GALLERY_KEYWORD_ID"
    t.index ["keyword"], name: "MEDIA_GALLERY_KEYWORD_KEYWORD", unique: true
  end

  create_table "msp_tfa_country_codes", primary_key: "msp_tfa_country_codes_id", id: { type: :integer, comment: "TFA admin user ID", unsigned: true }, charset: "utf8", comment: "msp_tfa_country_codes", force: :cascade do |t|
    t.text "code", null: false, comment: "Country code"
    t.text "name", null: false, comment: "Country name"
    t.text "dial_code", null: false, comment: "Prefix"
    t.index ["code"], name: "MSP_TFA_COUNTRY_CODES_CODE", length: 128
  end

  create_table "mview_state", primary_key: "state_id", id: { type: :integer, comment: "View State ID", unsigned: true }, charset: "utf8", comment: "View State", force: :cascade do |t|
    t.string "view_id", comment: "View ID"
    t.string "mode", limit: 16, default: "disabled", comment: "View Mode"
    t.string "status", limit: 16, default: "idle", comment: "View Status"
    t.datetime "updated", comment: "View updated time"
    t.integer "version_id", comment: "View Version ID", unsigned: true
    t.index ["mode"], name: "MVIEW_STATE_MODE"
    t.index ["view_id"], name: "MVIEW_STATE_VIEW_ID"
  end

  create_table "newsletter_problem", primary_key: "problem_id", id: { type: :integer, comment: "Problem ID", unsigned: true }, charset: "utf8", comment: "Newsletter Problems", force: :cascade do |t|
    t.integer "subscriber_id", comment: "Subscriber ID", unsigned: true
    t.integer "queue_id", default: 0, null: false, comment: "Queue ID", unsigned: true
    t.integer "problem_error_code", default: 0, comment: "Problem Error Code", unsigned: true
    t.string "problem_error_text", limit: 200, comment: "Problem Error Text"
    t.index ["queue_id"], name: "NEWSLETTER_PROBLEM_QUEUE_ID"
    t.index ["subscriber_id"], name: "NEWSLETTER_PROBLEM_SUBSCRIBER_ID"
  end

  create_table "newsletter_queue", primary_key: "queue_id", id: { type: :integer, comment: "Queue ID", unsigned: true }, charset: "utf8", comment: "Newsletter Queue", force: :cascade do |t|
    t.integer "template_id", default: 0, null: false, comment: "Template ID", unsigned: true
    t.integer "newsletter_type", comment: "Newsletter Type"
    t.text "newsletter_text", comment: "Newsletter Text"
    t.text "newsletter_styles", comment: "Newsletter Styles"
    t.string "newsletter_subject", limit: 200, comment: "Newsletter Subject"
    t.string "newsletter_sender_name", limit: 200, comment: "Newsletter Sender Name"
    t.string "newsletter_sender_email", limit: 200, comment: "Newsletter Sender Email"
    t.integer "queue_status", default: 0, null: false, comment: "Queue Status", unsigned: true
    t.timestamp "queue_start_at", comment: "Queue Start At"
    t.timestamp "queue_finish_at", comment: "Queue Finish At"
    t.index ["template_id"], name: "NEWSLETTER_QUEUE_TEMPLATE_ID"
  end

  create_table "newsletter_queue_link", primary_key: "queue_link_id", id: { type: :integer, comment: "Queue Link ID", unsigned: true }, charset: "utf8", comment: "Newsletter Queue Link", force: :cascade do |t|
    t.integer "queue_id", default: 0, null: false, comment: "Queue ID", unsigned: true
    t.integer "subscriber_id", default: 0, null: false, comment: "Subscriber ID", unsigned: true
    t.timestamp "letter_sent_at", comment: "Letter Sent At"
    t.index ["queue_id", "letter_sent_at"], name: "NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT"
    t.index ["subscriber_id"], name: "NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID"
  end

  create_table "newsletter_queue_store_link", primary_key: ["queue_id", "store_id"], charset: "utf8", comment: "Newsletter Queue Store Link", force: :cascade do |t|
    t.integer "queue_id", default: 0, null: false, comment: "Queue ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "NEWSLETTER_QUEUE_STORE_LINK_STORE_ID"
  end

  create_table "newsletter_subscriber", primary_key: "subscriber_id", id: { type: :integer, comment: "Subscriber ID", unsigned: true }, charset: "utf8", comment: "Newsletter Subscriber", force: :cascade do |t|
    t.integer "store_id", limit: 2, default: 0, comment: "Store ID", unsigned: true
    t.timestamp "change_status_at", comment: "Change Status At"
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.string "subscriber_email", limit: 150, comment: "Subscriber Email"
    t.integer "subscriber_status", default: 0, null: false, comment: "Subscriber Status"
    t.string "subscriber_confirm_code", limit: 32, default: "NULL", comment: "Subscriber Confirm Code"
    t.integer "mp_smtp_email_marketing_synced", limit: 2, default: 0, comment: "Mp SMTP Email Marketing synced"
    t.index ["customer_id"], name: "NEWSLETTER_SUBSCRIBER_CUSTOMER_ID"
    t.index ["store_id"], name: "NEWSLETTER_SUBSCRIBER_STORE_ID"
    t.index ["subscriber_email"], name: "NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL"
  end

  create_table "newsletter_template", primary_key: "template_id", id: { type: :integer, comment: "Template ID", unsigned: true }, charset: "utf8", comment: "Newsletter Template", force: :cascade do |t|
    t.string "template_code", limit: 150, comment: "Template Code"
    t.text "template_text", comment: "Template Text"
    t.text "template_styles", comment: "Template Styles"
    t.integer "template_type", comment: "Template Type", unsigned: true
    t.string "template_subject", limit: 200, comment: "Template Subject"
    t.string "template_sender_name", limit: 200, comment: "Template Sender Name"
    t.string "template_sender_email", limit: 200, comment: "Template Sender Email"
    t.integer "template_actual", limit: 2, default: 1, comment: "Template Actual", unsigned: true
    t.timestamp "added_at", comment: "Added At"
    t.timestamp "modified_at", comment: "Modified At"
    t.boolean "is_legacy", default: false, null: false, comment: "Should the template render in legacy mode"
    t.index ["added_at"], name: "NEWSLETTER_TEMPLATE_ADDED_AT"
    t.index ["modified_at"], name: "NEWSLETTER_TEMPLATE_MODIFIED_AT"
    t.index ["template_actual"], name: "NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL"
  end

  create_table "oauth_consumer", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "OAuth Consumers", force: :cascade do |t|
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.string "name", null: false, comment: "Name of consumer"
    t.string "key", limit: 32, null: false, comment: "Key code"
    t.string "secret", limit: 32, null: false, comment: "Secret code"
    t.text "callback_url", comment: "Callback URL"
    t.text "rejected_callback_url", null: false, comment: "Rejected callback URL"
    t.index ["created_at"], name: "OAUTH_CONSUMER_CREATED_AT"
    t.index ["key"], name: "OAUTH_CONSUMER_KEY", unique: true
    t.index ["secret"], name: "OAUTH_CONSUMER_SECRET", unique: true
    t.index ["updated_at"], name: "OAUTH_CONSUMER_UPDATED_AT"
  end

  create_table "oauth_nonce", id: false, charset: "utf8", comment: "OAuth Nonce", force: :cascade do |t|
    t.string "nonce", limit: 32, null: false, comment: "Nonce String"
    t.integer "timestamp", null: false, comment: "Nonce Timestamp", unsigned: true
    t.integer "consumer_id", null: false, comment: "Consumer ID", unsigned: true
    t.index ["consumer_id"], name: "OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID"
    t.index ["nonce", "consumer_id"], name: "OAUTH_NONCE_NONCE_CONSUMER_ID", unique: true
    t.index ["timestamp"], name: "OAUTH_NONCE_TIMESTAMP"
  end

  create_table "oauth_token", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "OAuth Tokens", force: :cascade do |t|
    t.integer "consumer_id", comment: "Oauth Consumer ID", unsigned: true
    t.integer "admin_id", comment: "Admin user ID", unsigned: true
    t.integer "customer_id", comment: "Customer user ID", unsigned: true
    t.string "type", limit: 16, null: false, comment: "Token Type"
    t.string "token", limit: 32, null: false, comment: "Token"
    t.string "secret", limit: 32, null: false, comment: "Token Secret"
    t.string "verifier", limit: 32, comment: "Token Verifier"
    t.text "callback_url", null: false, comment: "Token Callback URL"
    t.integer "revoked", limit: 2, default: 0, null: false, comment: "Is Token revoked", unsigned: true
    t.integer "authorized", limit: 2, default: 0, null: false, comment: "Is Token authorized", unsigned: true
    t.integer "user_type", comment: "User type"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Token creation timestamp"
    t.index ["admin_id"], name: "OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID"
    t.index ["consumer_id"], name: "OAUTH_TOKEN_CONSUMER_ID"
    t.index ["customer_id"], name: "OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID"
    t.index ["token"], name: "OAUTH_TOKEN_TOKEN", unique: true
  end

  create_table "oauth_token_request_log", primary_key: "log_id", id: { type: :integer, comment: "Log ID", unsigned: true }, charset: "utf8", comment: "Log of token request authentication failures.", force: :cascade do |t|
    t.string "user_name", null: false, comment: "Customer email or admin login"
    t.integer "user_type", limit: 2, null: false, comment: "User type (admin or customer)", unsigned: true
    t.integer "failures_count", limit: 2, default: 0, comment: "Number of failed authentication attempts in a row", unsigned: true
    t.timestamp "lock_expires_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Lock expiration time"
    t.index ["user_name", "user_type"], name: "OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE", unique: true
  end

  create_table "option_types", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "option_values", charset: "latin1", force: :cascade do |t|
    t.text "value"
    t.bigint "option_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_type_id"], name: "index_option_values_on_option_type_id"
  end

  create_table "order_status", primary_key: "entity_id", id: { type: :integer, comment: "Entity id", unsigned: true }, charset: "utf8", comment: "Order Status", force: :cascade do |t|
    t.string "order_id", null: false
    t.string "order_status", default: "0", null: false, comment: "Order Status"
    t.string "order_state", default: "0", null: false, comment: "Order State"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
  end

  create_table "password_reset_request_event", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Password Reset Request Event under a security control", force: :cascade do |t|
    t.integer "request_type", limit: 2, null: false, comment: "Type of the event under a security control", unsigned: true
    t.string "account_reference", comment: "An identifier for existing account or another target"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Timestamp when the event occurs"
    t.string "ip", limit: 15, null: false, comment: "Remote user IP"
    t.index ["account_reference"], name: "PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE"
    t.index ["created_at"], name: "PASSWORD_RESET_REQUEST_EVENT_CREATED_AT"
  end

  create_table "patch_list", primary_key: "patch_id", id: { type: :integer, comment: "Patch Auto Increment" }, charset: "utf8", comment: "List of data/schema patches", force: :cascade do |t|
    t.string "patch_name", limit: 1024, null: false, comment: "Patch Class Name"
  end

  create_table "paypal_billing_agreement", primary_key: "agreement_id", id: { type: :integer, comment: "Agreement ID", unsigned: true }, charset: "utf8", comment: "Sales Billing Agreement", force: :cascade do |t|
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.string "method_code", limit: 32, null: false, comment: "Method Code"
    t.string "reference_id", limit: 32, null: false, comment: "Reference ID"
    t.string "status", limit: 20, null: false, comment: "Status"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "agreement_label", comment: "Agreement Label"
    t.index ["customer_id"], name: "PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID"
    t.index ["store_id"], name: "PAYPAL_BILLING_AGREEMENT_STORE_ID"
  end

  create_table "paypal_billing_agreement_order", primary_key: ["agreement_id", "order_id"], charset: "utf8", comment: "Sales Billing Agreement Order", force: :cascade do |t|
    t.integer "agreement_id", null: false, comment: "Agreement ID", unsigned: true
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.index ["order_id"], name: "PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID"
  end

  create_table "paypal_cert", primary_key: "cert_id", id: { type: :integer, limit: 2, comment: "Cert ID", unsigned: true }, charset: "utf8", comment: "Paypal Certificate Table", force: :cascade do |t|
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.text "content", comment: "Content"
    t.timestamp "updated_at", comment: "Updated At"
    t.index ["website_id"], name: "PAYPAL_CERT_WEBSITE_ID"
  end

  create_table "paypal_payment_transaction", primary_key: "transaction_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "PayPal Payflow Link Payment Transaction", force: :cascade do |t|
    t.string "txn_id", limit: 100, comment: "Txn ID"
    t.binary "additional_information", comment: "Additional Information"
    t.timestamp "created_at", comment: "Created At"
    t.index ["txn_id"], name: "PAYPAL_PAYMENT_TRANSACTION_TXN_ID", unique: true
  end

  create_table "paypal_settlement_report", primary_key: "report_id", id: { type: :integer, comment: "Report ID", unsigned: true }, charset: "utf8", comment: "Paypal Settlement Report Table", force: :cascade do |t|
    t.date "report_date", comment: "Report Date"
    t.string "account_id", limit: 64, comment: "Account ID"
    t.string "filename", limit: 24, comment: "Filename"
    t.timestamp "last_modified", comment: "Last Modified"
    t.index ["report_date", "account_id"], name: "PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID", unique: true
  end

  create_table "paypal_settlement_report_row", primary_key: "row_id", id: { type: :integer, comment: "Row ID", unsigned: true }, charset: "utf8", comment: "Paypal Settlement Report Row Table", force: :cascade do |t|
    t.integer "report_id", null: false, comment: "Report ID", unsigned: true
    t.string "transaction_id", limit: 19, comment: "Transaction ID"
    t.string "invoice_id", limit: 127, comment: "Invoice ID"
    t.string "paypal_reference_id", limit: 19, comment: "Paypal Reference ID"
    t.string "paypal_reference_id_type", limit: 3, comment: "Paypal Reference ID Type"
    t.string "transaction_event_code", limit: 5, comment: "Transaction Event Code"
    t.timestamp "transaction_initiation_date", comment: "Transaction Initiation Date"
    t.timestamp "transaction_completion_date", comment: "Transaction Completion Date"
    t.string "transaction_debit_or_credit", limit: 2, default: "CR", null: false, comment: "Transaction Debit Or Credit"
    t.decimal "gross_transaction_amount", precision: 20, scale: 6, default: "0.0", null: false, comment: "Gross Transaction Amount"
    t.string "gross_transaction_currency", limit: 3, comment: "Gross Transaction Currency"
    t.string "fee_debit_or_credit", limit: 2, comment: "Fee Debit Or Credit"
    t.decimal "fee_amount", precision: 20, scale: 6, default: "0.0", null: false, comment: "Fee Amount"
    t.string "fee_currency", limit: 3, comment: "Fee Currency"
    t.string "custom_field", comment: "Custom Field"
    t.string "consumer_id", limit: 127, comment: "Consumer ID"
    t.string "payment_tracking_id", comment: "Payment Tracking ID"
    t.string "store_id", limit: 50, comment: "Store ID"
    t.index ["report_id"], name: "PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID"
  end

  create_table "persistent_session", primary_key: "persistent_id", id: { type: :integer, comment: "Session ID", unsigned: true }, charset: "utf8", comment: "Persistent Session", force: :cascade do |t|
    t.string "key", limit: 50, null: false, comment: "Unique cookie key"
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.text "info", comment: "Session Data"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.index ["customer_id"], name: "PERSISTENT_SESSION_CUSTOMER_ID", unique: true
    t.index ["key"], name: "PERSISTENT_SESSION_KEY", unique: true
    t.index ["updated_at"], name: "PERSISTENT_SESSION_UPDATED_AT"
    t.index ["website_id"], name: "PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID"
  end

  create_table "product_alert_price", primary_key: "alert_price_id", id: { type: :integer, comment: "Product alert price ID", unsigned: true }, charset: "utf8", comment: "Product Alert Price", force: :cascade do |t|
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.decimal "price", precision: 20, scale: 6, default: "0.0", null: false, comment: "Price amount"
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, comment: "Store ID", unsigned: true
    t.timestamp "add_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Product alert add date"
    t.timestamp "last_send_date", comment: "Product alert last send date"
    t.integer "send_count", limit: 2, default: 0, null: false, comment: "Product alert send count", unsigned: true
    t.integer "status", limit: 2, default: 0, null: false, comment: "Product alert status", unsigned: true
    t.index ["customer_id"], name: "PRODUCT_ALERT_PRICE_CUSTOMER_ID"
    t.index ["product_id"], name: "PRODUCT_ALERT_PRICE_PRODUCT_ID"
    t.index ["store_id"], name: "PRODUCT_ALERT_PRICE_STORE_ID"
    t.index ["website_id"], name: "PRODUCT_ALERT_PRICE_WEBSITE_ID"
  end

  create_table "product_alert_stock", primary_key: "alert_stock_id", id: { type: :integer, comment: "Product alert stock ID", unsigned: true }, charset: "utf8", comment: "Product Alert Stock", force: :cascade do |t|
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, comment: "Store ID", unsigned: true
    t.timestamp "add_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Product alert add date"
    t.timestamp "send_date", comment: "Product alert send date"
    t.integer "send_count", limit: 2, default: 0, null: false, comment: "Send Count", unsigned: true
    t.integer "status", limit: 2, default: 0, null: false, comment: "Product alert status", unsigned: true
    t.index ["customer_id"], name: "PRODUCT_ALERT_STOCK_CUSTOMER_ID"
    t.index ["product_id"], name: "PRODUCT_ALERT_STOCK_PRODUCT_ID"
    t.index ["store_id"], name: "PRODUCT_ALERT_STOCK_STORE_ID"
    t.index ["website_id"], name: "PRODUCT_ALERT_STOCK_WEBSITE_ID"
  end

  create_table "queue", id: { type: :integer, comment: "Queue ID", unsigned: true }, charset: "utf8", comment: "Table storing unique queues", force: :cascade do |t|
    t.string "name", comment: "Queue name"
    t.index ["name"], name: "QUEUE_NAME", unique: true
  end

  create_table "queue_lock", id: { type: :integer, comment: "Message ID", unsigned: true }, charset: "utf8", comment: "Messages that were processed are inserted here to be locked.", force: :cascade do |t|
    t.string "message_code", default: "", null: false, comment: "Message Code"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.index ["message_code"], name: "QUEUE_LOCK_MESSAGE_CODE", unique: true
  end

  create_table "queue_message", id: { type: :bigint, comment: "Message ID", unsigned: true }, charset: "utf8", comment: "Queue messages", force: :cascade do |t|
    t.string "topic_name", comment: "Message topic"
    t.text "body", size: :long, comment: "Message body"
  end

  create_table "queue_message_status", id: { type: :bigint, comment: "Relation ID", unsigned: true }, charset: "utf8", comment: "Relation table to keep associations between queues and messages", force: :cascade do |t|
    t.integer "queue_id", null: false, comment: "Queue ID", unsigned: true
    t.bigint "message_id", null: false, comment: "Message ID", unsigned: true
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "status", limit: 2, null: false, comment: "Message status in particular queue", unsigned: true
    t.integer "number_of_trials", limit: 2, default: 0, null: false, comment: "Number of trials to processed failed message processing", unsigned: true
    t.index ["message_id"], name: "QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID"
    t.index ["queue_id", "message_id"], name: "QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID", unique: true
    t.index ["status", "updated_at"], name: "QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT"
  end

  create_table "queue_poison_pill", id: false, charset: "utf8", comment: "Sequence table for poison pill versions", force: :cascade do |t|
    t.string "version", null: false, comment: "Poison Pill version."
  end

  create_table "quote", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote", force: :cascade do |t|
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "converted_at", comment: "Converted At"
    t.integer "is_active", limit: 2, default: 1, comment: "Is Active", unsigned: true
    t.integer "is_virtual", limit: 2, default: 0, comment: "Is Virtual", unsigned: true
    t.integer "is_multi_shipping", limit: 2, default: 0, comment: "Is Multi Shipping", unsigned: true
    t.integer "items_count", default: 0, comment: "Items Count", unsigned: true
    t.decimal "items_qty", precision: 12, scale: 4, default: "0.0", comment: "Items Qty"
    t.integer "orig_order_id", default: 0, comment: "Orig Order ID", unsigned: true
    t.decimal "store_to_base_rate", precision: 12, scale: 4, default: "0.0", comment: "Store To Base Rate"
    t.decimal "store_to_quote_rate", precision: 12, scale: 4, default: "0.0", comment: "Store To Quote Rate"
    t.string "base_currency_code", comment: "Base Currency Code"
    t.string "store_currency_code", comment: "Store Currency Code"
    t.string "quote_currency_code", comment: "Quote Currency Code"
    t.decimal "grand_total", precision: 20, scale: 4, default: "0.0", comment: "Grand Total"
    t.decimal "base_grand_total", precision: 20, scale: 4, default: "0.0", comment: "Base Grand Total"
    t.string "checkout_method", comment: "Checkout Method"
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "customer_tax_class_id", comment: "Customer Tax Class ID", unsigned: true
    t.integer "customer_group_id", default: 0, comment: "Customer Group ID", unsigned: true
    t.string "customer_email", comment: "Customer Email"
    t.string "customer_prefix", limit: 40, comment: "Customer Prefix"
    t.string "customer_firstname", comment: "Customer Firstname"
    t.string "customer_middlename", limit: 40, comment: "Customer Middlename"
    t.string "customer_lastname", comment: "Customer Lastname"
    t.string "customer_suffix", limit: 40, comment: "Customer Suffix"
    t.datetime "customer_dob", comment: "Customer Dob"
    t.text "customer_note", comment: "Customer Note"
    t.integer "customer_note_notify", limit: 2, default: 1, comment: "Customer Note Notify", unsigned: true
    t.integer "customer_is_guest", limit: 2, default: 0, comment: "Customer Is Guest", unsigned: true
    t.string "remote_ip", limit: 45, comment: "Remote Ip"
    t.string "applied_rule_ids", comment: "Applied Rule Ids"
    t.string "reserved_order_id", limit: 64, comment: "Reserved Order ID"
    t.string "password_hash", comment: "Password Hash"
    t.string "coupon_code", comment: "Coupon Code"
    t.string "global_currency_code", comment: "Global Currency Code"
    t.decimal "base_to_global_rate", precision: 20, scale: 4, comment: "Base To Global Rate"
    t.decimal "base_to_quote_rate", precision: 20, scale: 4, comment: "Base To Quote Rate"
    t.string "customer_taxvat", comment: "Customer Taxvat"
    t.string "customer_gender", comment: "Customer Gender"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "base_subtotal", precision: 20, scale: 4, comment: "Base Subtotal"
    t.decimal "subtotal_with_discount", precision: 20, scale: 4, comment: "Subtotal With Discount"
    t.decimal "base_subtotal_with_discount", precision: 20, scale: 4, comment: "Base Subtotal With Discount"
    t.integer "is_changed", comment: "Is Changed", unsigned: true
    t.integer "trigger_recollect", limit: 2, default: 0, null: false, comment: "Trigger Recollect"
    t.text "ext_shipping_info", comment: "Ext Shipping Info"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "is_persistent", limit: 2, default: 0, comment: "Is Quote Persistent", unsigned: true
    t.decimal "payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee"
    t.decimal "base_payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee"
    t.decimal "payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee Tax"
    t.decimal "base_payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee Tax"
    t.boolean "amstorecredit_use", comment: "Amstorecredit Use"
    t.decimal "amstorecredit_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Base Amount"
    t.decimal "amstorecredit_amount", precision: 12, scale: 4, comment: "Amstorecredit Amount"
    t.decimal "bss_giftcard_amount", precision: 12, scale: 4, comment: "Bss Giftcard Amount"
    t.decimal "base_bss_giftcard_amount", precision: 12, scale: 4, comment: "Base Bss Giftcard Amount"
    t.string "mp_smtp_ace_token", comment: "ACE Token"
    t.integer "mp_smtp_ace_sent", limit: 2, default: 0, comment: "ACE Sent"
    t.text "mp_smtp_ace_log_ids", comment: "ACE Log Ids"
    t.text "mp_smtp_ace_log_data", comment: "ACE Log Data"
    t.index ["customer_id", "store_id", "is_active"], name: "QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE"
    t.index ["store_id"], name: "QUOTE_STORE_ID"
  end

  create_table "quote_address", primary_key: "address_id", id: { type: :integer, comment: "Address ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Address", force: :cascade do |t|
    t.integer "quote_id", default: 0, null: false, comment: "Quote ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "save_in_address_book", limit: 2, default: 0, comment: "Save In Address Book"
    t.integer "customer_address_id", comment: "Customer Address ID", unsigned: true
    t.string "address_type", limit: 10, comment: "Address Type"
    t.string "email", comment: "Email"
    t.string "prefix", limit: 40, comment: "Prefix"
    t.string "firstname"
    t.string "middlename", limit: 40
    t.string "lastname"
    t.string "suffix", limit: 40, comment: "Suffix"
    t.string "company", comment: "Company"
    t.string "street", comment: "Street"
    t.string "city"
    t.string "region"
    t.integer "region_id", comment: "Region ID", unsigned: true
    t.string "postcode", limit: 20, comment: "Postcode"
    t.string "country_id", limit: 30, comment: "Country ID"
    t.string "telephone"
    t.string "fax"
    t.integer "same_as_billing", limit: 2, default: 0, null: false, comment: "Same As Billing", unsigned: true
    t.integer "collect_shipping_rates", limit: 2, default: 0, null: false, comment: "Collect Shipping Rates", unsigned: true
    t.string "shipping_method", limit: 120
    t.string "shipping_description", comment: "Shipping Description"
    t.decimal "weight", precision: 12, scale: 4, default: "0.0", null: false, comment: "Weight"
    t.decimal "subtotal", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal"
    t.decimal "base_subtotal", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Subtotal"
    t.decimal "subtotal_with_discount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal With Discount"
    t.decimal "base_subtotal_with_discount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Subtotal With Discount"
    t.decimal "tax_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Tax Amount"
    t.decimal "base_tax_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Tax Amount"
    t.decimal "shipping_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Shipping Amount"
    t.decimal "base_shipping_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Shipping Amount"
    t.decimal "shipping_tax_amount", precision: 20, scale: 4, comment: "Shipping Tax Amount"
    t.decimal "base_shipping_tax_amount", precision: 20, scale: 4, comment: "Base Shipping Tax Amount"
    t.decimal "discount_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Discount Amount"
    t.decimal "base_discount_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Discount Amount"
    t.decimal "grand_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Grand Total"
    t.decimal "base_grand_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Grand Total"
    t.text "customer_notes", comment: "Customer Notes"
    t.text "applied_taxes", comment: "Applied Taxes"
    t.string "discount_description", comment: "Discount Description"
    t.decimal "shipping_discount_amount", precision: 20, scale: 4, comment: "Shipping Discount Amount"
    t.decimal "base_shipping_discount_amount", precision: 20, scale: 4, comment: "Base Shipping Discount Amount"
    t.decimal "subtotal_incl_tax", precision: 20, scale: 4, comment: "Subtotal Incl Tax"
    t.decimal "base_subtotal_total_incl_tax", precision: 20, scale: 4, comment: "Base Subtotal Total Incl Tax"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.decimal "shipping_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Shipping Discount Tax Compensation Amount"
    t.decimal "base_shipping_discount_tax_compensation_amnt", precision: 20, scale: 4, comment: "Base Shipping Discount Tax Compensation Amount"
    t.decimal "shipping_incl_tax", precision: 20, scale: 4, comment: "Shipping Incl Tax"
    t.decimal "base_shipping_incl_tax", precision: 20, scale: 4, comment: "Base Shipping Incl Tax"
    t.text "vat_id", comment: "Vat ID"
    t.integer "vat_is_valid", limit: 2, comment: "Vat Is Valid"
    t.text "vat_request_id", comment: "Vat Request ID"
    t.text "vat_request_date", comment: "Vat Request Date"
    t.integer "vat_request_success", limit: 2, comment: "Vat Request Success"
    t.text "validated_country_code", comment: "Validated Country Code"
    t.text "validated_vat_number", comment: "Validated Vat Number"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "free_shipping", limit: 2, default: 0, null: false, comment: "Free Shipping", unsigned: true
    t.decimal "payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee"
    t.decimal "base_payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee"
    t.decimal "payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee Tax"
    t.decimal "base_payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee Tax"
    t.index ["quote_id"], name: "QUOTE_ADDRESS_QUOTE_ID"
  end

  create_table "quote_address_item", primary_key: "address_item_id", id: { type: :integer, comment: "Address Item ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Address Item", force: :cascade do |t|
    t.integer "parent_item_id", comment: "Parent Item ID", unsigned: true
    t.integer "quote_address_id", default: 0, null: false, comment: "Quote Address ID", unsigned: true
    t.integer "quote_item_id", default: 0, null: false, comment: "Quote Item ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.text "applied_rule_ids", comment: "Applied Rule Ids"
    t.text "additional_data", comment: "Additional Data"
    t.decimal "weight", precision: 12, scale: 4, default: "0.0", comment: "Weight"
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.decimal "discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Discount Amount"
    t.decimal "tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Tax Amount"
    t.decimal "row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Row Total"
    t.decimal "base_row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Row Total"
    t.decimal "row_total_with_discount", precision: 20, scale: 4, default: "0.0", comment: "Row Total With Discount"
    t.decimal "base_discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Discount Amount"
    t.decimal "base_tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Tax Amount"
    t.decimal "row_weight", precision: 12, scale: 4, default: "0.0", comment: "Row Weight"
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.integer "super_product_id", comment: "Super Product ID", unsigned: true
    t.integer "parent_product_id", comment: "Parent Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "sku", comment: "Sku"
    t.string "image", comment: "Image"
    t.string "name", comment: "Name"
    t.text "description", comment: "Description"
    t.integer "is_qty_decimal", comment: "Is Qty Decimal", unsigned: true
    t.decimal "price", precision: 12, scale: 4, comment: "Price"
    t.decimal "discount_percent", precision: 12, scale: 4, comment: "Discount Percent"
    t.integer "no_discount", comment: "No Discount", unsigned: true
    t.decimal "tax_percent", precision: 12, scale: 4, comment: "Tax Percent"
    t.decimal "base_price", precision: 12, scale: 4, comment: "Base Price"
    t.decimal "base_cost", precision: 12, scale: 4, comment: "Base Cost"
    t.decimal "price_incl_tax", precision: 20, scale: 4, comment: "Price Incl Tax"
    t.decimal "base_price_incl_tax", precision: 20, scale: 4, comment: "Base Price Incl Tax"
    t.decimal "row_total_incl_tax", precision: 20, scale: 4, comment: "Row Total Incl Tax"
    t.decimal "base_row_total_incl_tax", precision: 20, scale: 4, comment: "Base Row Total Incl Tax"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "free_shipping", comment: "Free Shipping", unsigned: true
    t.index ["parent_item_id"], name: "QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID"
    t.index ["quote_address_id"], name: "QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID"
    t.index ["quote_item_id"], name: "QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID"
    t.index ["store_id"], name: "QUOTE_ADDRESS_ITEM_STORE_ID"
  end

  create_table "quote_id_mask", primary_key: ["entity_id", "quote_id"], charset: "utf8", comment: "Quote ID and masked ID mapping", force: :cascade do |t|
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true, auto_increment: true
    t.integer "quote_id", null: false, comment: "Quote ID", unsigned: true
    t.string "masked_id", limit: 32, comment: "Masked ID"
    t.index ["masked_id"], name: "QUOTE_ID_MASK_MASKED_ID"
    t.index ["quote_id"], name: "QUOTE_ID_MASK_QUOTE_ID"
  end

  create_table "quote_item", primary_key: "item_id", id: { type: :integer, comment: "Item ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Item", force: :cascade do |t|
    t.integer "quote_id", default: 0, null: false, comment: "Quote ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "parent_item_id", comment: "Parent Item ID", unsigned: true
    t.integer "is_virtual", limit: 2, comment: "Is Virtual", unsigned: true
    t.string "sku", comment: "Sku"
    t.string "name", comment: "Name"
    t.text "description", comment: "Description"
    t.text "applied_rule_ids", comment: "Applied Rule Ids"
    t.text "additional_data", comment: "Additional Data"
    t.integer "is_qty_decimal", limit: 2, comment: "Is Qty Decimal", unsigned: true
    t.integer "no_discount", limit: 2, default: 0, comment: "No Discount", unsigned: true
    t.decimal "weight", precision: 12, scale: 4, default: "0.0", comment: "Weight"
    t.decimal "qty", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty"
    t.decimal "price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Price"
    t.decimal "base_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Base Price"
    t.decimal "custom_price", precision: 12, scale: 4, comment: "Custom Price"
    t.decimal "discount_percent", precision: 12, scale: 4, default: "0.0", comment: "Discount Percent"
    t.decimal "discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Discount Amount"
    t.decimal "base_discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Discount Amount"
    t.decimal "tax_percent", precision: 12, scale: 4, default: "0.0", comment: "Tax Percent"
    t.decimal "tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Tax Amount"
    t.decimal "base_tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Tax Amount"
    t.decimal "row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Row Total"
    t.decimal "base_row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Row Total"
    t.decimal "row_total_with_discount", precision: 20, scale: 4, default: "0.0", comment: "Row Total With Discount"
    t.decimal "row_weight", precision: 12, scale: 4, default: "0.0", comment: "Row Weight"
    t.string "product_type", comment: "Product Type"
    t.decimal "base_tax_before_discount", precision: 20, scale: 4, comment: "Base Tax Before Discount"
    t.decimal "tax_before_discount", precision: 20, scale: 4, comment: "Tax Before Discount"
    t.decimal "original_custom_price", precision: 12, scale: 4, comment: "Original Custom Price"
    t.string "redirect_url", comment: "Redirect Url"
    t.decimal "base_cost", precision: 12, scale: 4, comment: "Base Cost"
    t.decimal "price_incl_tax", precision: 20, scale: 4, comment: "Price Incl Tax"
    t.decimal "base_price_incl_tax", precision: 20, scale: 4, comment: "Base Price Incl Tax"
    t.decimal "row_total_incl_tax", precision: 20, scale: 4, comment: "Row Total Incl Tax"
    t.decimal "base_row_total_incl_tax", precision: 20, scale: 4, comment: "Base Row Total Incl Tax"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "free_shipping", limit: 2, default: 0, null: false, comment: "Free Shipping", unsigned: true
    t.text "weee_tax_applied", comment: "Weee Tax Applied"
    t.decimal "weee_tax_applied_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Amount"
    t.decimal "weee_tax_applied_row_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Row Amount"
    t.decimal "weee_tax_disposition", precision: 12, scale: 4, comment: "Weee Tax Disposition"
    t.decimal "weee_tax_row_disposition", precision: 12, scale: 4, comment: "Weee Tax Row Disposition"
    t.decimal "base_weee_tax_applied_amount", precision: 12, scale: 4, comment: "Base Weee Tax Applied Amount"
    t.decimal "base_weee_tax_applied_row_amnt", precision: 12, scale: 4, comment: "Base Weee Tax Applied Row Amnt"
    t.decimal "base_weee_tax_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Disposition"
    t.decimal "base_weee_tax_row_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Row Disposition"
    t.index ["parent_item_id"], name: "QUOTE_ITEM_PARENT_ITEM_ID"
    t.index ["product_id"], name: "QUOTE_ITEM_PRODUCT_ID"
    t.index ["quote_id"], name: "QUOTE_ITEM_QUOTE_ID"
    t.index ["store_id"], name: "QUOTE_ITEM_STORE_ID"
  end

  create_table "quote_item_option", primary_key: "option_id", id: { type: :integer, comment: "Option ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Item Option", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Item ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.string "code", null: false, comment: "Code"
    t.text "value", comment: "Value"
    t.index ["item_id"], name: "QUOTE_ITEM_OPTION_ITEM_ID"
  end

  create_table "quote_payment", primary_key: "payment_id", id: { type: :integer, comment: "Payment ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Payment", force: :cascade do |t|
    t.integer "quote_id", default: 0, null: false, comment: "Quote ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.string "method", comment: "Method"
    t.string "cc_type", comment: "Cc Type"
    t.string "cc_number_enc", comment: "Cc Number Enc"
    t.string "cc_last_4", comment: "Cc Last 4"
    t.string "cc_cid_enc", comment: "Cc Cid Enc"
    t.string "cc_owner", comment: "Cc Owner"
    t.string "cc_exp_month", comment: "Cc Exp Month"
    t.integer "cc_exp_year", limit: 2, default: 0, comment: "Cc Exp Year", unsigned: true
    t.string "cc_ss_owner", comment: "Cc Ss Owner"
    t.integer "cc_ss_start_month", limit: 2, default: 0, comment: "Cc Ss Start Month", unsigned: true
    t.integer "cc_ss_start_year", limit: 2, default: 0, comment: "Cc Ss Start Year", unsigned: true
    t.string "po_number", comment: "Po Number"
    t.text "additional_data", comment: "Additional Data"
    t.string "cc_ss_issue", comment: "Cc Ss Issue"
    t.text "additional_information", comment: "Additional Information"
    t.string "paypal_payer_id", comment: "Paypal Payer ID"
    t.string "paypal_payer_status", comment: "Paypal Payer Status"
    t.string "paypal_correlation_id", comment: "Paypal Correlation ID"
    t.index ["quote_id"], name: "QUOTE_PAYMENT_QUOTE_ID"
  end

  create_table "quote_shipping_rate", primary_key: "rate_id", id: { type: :integer, comment: "Rate ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Quote Shipping Rate", force: :cascade do |t|
    t.integer "address_id", default: 0, null: false, comment: "Address ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.string "carrier", comment: "Carrier"
    t.string "carrier_title", comment: "Carrier Title"
    t.string "code", comment: "Code"
    t.string "method", comment: "Method"
    t.text "method_description", comment: "Method Description"
    t.decimal "price", precision: 20, scale: 4, default: "0.0", null: false, comment: "Price"
    t.text "error_message", comment: "Error Message"
    t.text "method_title", comment: "Method Title"
    t.index ["address_id"], name: "QUOTE_SHIPPING_RATE_ADDRESS_ID"
  end

  create_table "rating", primary_key: "rating_id", id: { type: :integer, limit: 2, comment: "Rating ID", unsigned: true }, charset: "utf8", comment: "Ratings", force: :cascade do |t|
    t.integer "entity_id", limit: 2, default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "rating_code", limit: 64, null: false, comment: "Rating Code"
    t.integer "position", limit: 2, default: 0, null: false, comment: "Rating Position On Storefront", unsigned: true
    t.integer "is_active", limit: 2, default: 1, null: false, comment: "Rating is active."
    t.index ["entity_id"], name: "RATING_ENTITY_ID"
    t.index ["rating_code"], name: "RATING_RATING_CODE", unique: true
  end

  create_table "rating_entity", primary_key: "entity_id", id: { type: :integer, limit: 2, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Rating entities", force: :cascade do |t|
    t.string "entity_code", limit: 64, null: false, comment: "Entity Code"
    t.index ["entity_code"], name: "RATING_ENTITY_ENTITY_CODE", unique: true
  end

  create_table "rating_option", primary_key: "option_id", id: { type: :integer, comment: "Rating Option ID", unsigned: true }, charset: "utf8", comment: "Rating options", force: :cascade do |t|
    t.integer "rating_id", limit: 2, default: 0, null: false, comment: "Rating ID", unsigned: true
    t.string "code", limit: 32, null: false, comment: "Rating Option Code"
    t.integer "value", limit: 2, default: 0, null: false, comment: "Rating Option Value", unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, comment: "Ration option position on Storefront", unsigned: true
    t.index ["rating_id"], name: "RATING_OPTION_RATING_ID"
  end

  create_table "rating_option_vote", primary_key: "vote_id", id: { type: :bigint, comment: "Vote ID", unsigned: true }, charset: "utf8", comment: "Rating option values", force: :cascade do |t|
    t.integer "option_id", default: 0, null: false, comment: "Vote option ID", unsigned: true
    t.string "remote_ip", limit: 16, null: false, comment: "Customer IP"
    t.bigint "remote_ip_long", default: 0, null: false, comment: "Customer IP converted to long integer format"
    t.integer "customer_id", default: 0, comment: "Customer ID", unsigned: true
    t.bigint "entity_pk_value", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "rating_id", limit: 2, default: 0, null: false, comment: "Rating ID", unsigned: true
    t.bigint "review_id", comment: "Review ID", unsigned: true
    t.integer "percent", limit: 2, default: 0, null: false, comment: "Percent amount"
    t.integer "value", limit: 2, default: 0, null: false, comment: "Vote option value"
    t.index ["option_id"], name: "RATING_OPTION_VOTE_OPTION_ID"
    t.index ["review_id"], name: "RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID"
  end

  create_table "rating_option_vote_aggregated", primary_key: "primary_id", id: { type: :integer, comment: "Vote aggregation ID" }, charset: "utf8", comment: "Rating vote aggregated", force: :cascade do |t|
    t.integer "rating_id", limit: 2, default: 0, null: false, comment: "Rating ID", unsigned: true
    t.bigint "entity_pk_value", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "vote_count", default: 0, null: false, comment: "Vote dty", unsigned: true
    t.integer "vote_value_sum", default: 0, null: false, comment: "General vote sum", unsigned: true
    t.integer "percent", limit: 2, default: 0, null: false, comment: "Vote percent"
    t.integer "percent_approved", limit: 2, default: 0, comment: "Vote percent approved by admin"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.index ["rating_id"], name: "RATING_OPTION_VOTE_AGGREGATED_RATING_ID"
    t.index ["store_id"], name: "RATING_OPTION_VOTE_AGGREGATED_STORE_ID"
  end

  create_table "rating_store", primary_key: ["rating_id", "store_id"], charset: "utf8", comment: "Rating Store", force: :cascade do |t|
    t.integer "rating_id", limit: 2, default: 0, null: false, comment: "Rating ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "RATING_STORE_STORE_ID"
  end

  create_table "rating_title", primary_key: ["rating_id", "store_id"], charset: "utf8", comment: "Rating Title", force: :cascade do |t|
    t.integer "rating_id", limit: 2, default: 0, null: false, comment: "Rating ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "value", null: false, comment: "Rating Label"
    t.index ["store_id"], name: "RATING_TITLE_STORE_ID"
  end

  create_table "release_notification_viewer_log", id: { type: :integer, comment: "Log ID", unsigned: true }, charset: "utf8", comment: "Release Notification Viewer Log Table", force: :cascade do |t|
    t.integer "viewer_id", null: false, comment: "Viewer admin user ID", unsigned: true
    t.string "last_view_version", limit: 16, null: false, comment: "Viewer last view on product version"
    t.index ["viewer_id"], name: "RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID", unique: true
  end

  create_table "report_compared_product_index", primary_key: "index_id", id: { type: :bigint, comment: "Index ID", unsigned: true }, charset: "utf8", comment: "Reports Compared Product Index Table", force: :cascade do |t|
    t.integer "visitor_id", comment: "Visitor ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.timestamp "added_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Added At"
    t.index ["added_at"], name: "REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT"
    t.index ["customer_id", "product_id"], name: "REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID"
    t.index ["store_id"], name: "REPORT_COMPARED_PRODUCT_INDEX_STORE_ID"
    t.index ["visitor_id", "product_id"], name: "REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID", unique: true
  end

  create_table "report_event", primary_key: "event_id", id: { type: :bigint, comment: "Event ID", unsigned: true }, charset: "utf8", comment: "Reports Event Table", force: :cascade do |t|
    t.timestamp "logged_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Logged At"
    t.integer "event_type_id", limit: 2, default: 0, null: false, comment: "Event Type ID", unsigned: true
    t.integer "object_id", default: 0, null: false, comment: "Object ID", unsigned: true
    t.integer "subject_id", default: 0, null: false, comment: "Subject ID", unsigned: true
    t.integer "subtype", limit: 2, default: 0, null: false, comment: "Subtype", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["event_type_id"], name: "REPORT_EVENT_EVENT_TYPE_ID"
    t.index ["object_id"], name: "REPORT_EVENT_OBJECT_ID"
    t.index ["store_id"], name: "REPORT_EVENT_STORE_ID"
    t.index ["subject_id"], name: "REPORT_EVENT_SUBJECT_ID"
    t.index ["subtype"], name: "REPORT_EVENT_SUBTYPE"
  end

  create_table "report_event_types", primary_key: "event_type_id", id: { type: :integer, limit: 2, comment: "Event Type ID", unsigned: true }, charset: "utf8", comment: "Reports Event Type Table", force: :cascade do |t|
    t.string "event_name", limit: 64, null: false, comment: "Event Name"
    t.integer "customer_login", limit: 2, default: 0, null: false, comment: "Customer Login", unsigned: true
  end

  create_table "report_viewed_product_aggregated_daily", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Most Viewed Products Aggregated Daily", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.integer "views_num", default: 0, null: false, comment: "Number of Views"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID", unique: true
    t.index ["product_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID"
    t.index ["store_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID"
  end

  create_table "report_viewed_product_aggregated_monthly", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Most Viewed Products Aggregated Monthly", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.integer "views_num", default: 0, null: false, comment: "Number of Views"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID", unique: true
    t.index ["product_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID"
    t.index ["store_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID"
  end

  create_table "report_viewed_product_aggregated_yearly", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Most Viewed Products Aggregated Yearly", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.integer "views_num", default: 0, null: false, comment: "Number of Views"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID", unique: true
    t.index ["product_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID"
    t.index ["store_id"], name: "REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID"
  end

  create_table "report_viewed_product_index", primary_key: "index_id", id: { type: :bigint, comment: "Index ID", unsigned: true }, charset: "utf8", comment: "Reports Viewed Product Index Table", force: :cascade do |t|
    t.integer "visitor_id", comment: "Visitor ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.timestamp "added_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Added At"
    t.index ["added_at"], name: "REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT"
    t.index ["customer_id", "product_id"], name: "REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID"
    t.index ["store_id"], name: "REPORT_VIEWED_PRODUCT_INDEX_STORE_ID"
    t.index ["visitor_id", "product_id"], name: "REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID", unique: true
  end

  create_table "reporting_counts", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Reporting for all count related events generated via the cron job", force: :cascade do |t|
    t.string "type", comment: "Item Reported"
    t.integer "count", comment: "Count Value", unsigned: true
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "reporting_module_status", primary_key: "entity_id", id: { type: :integer, comment: "Module ID", unsigned: true }, charset: "utf8", comment: "Module Status Table", force: :cascade do |t|
    t.string "name", comment: "Module Name"
    t.string "active", comment: "Module Active Status"
    t.string "setup_version", comment: "Module Version"
    t.string "state", comment: "Module State"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "reporting_orders", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Reporting for all orders", force: :cascade do |t|
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.decimal "total", precision: 20, scale: 4, unsigned: true
    t.decimal "total_base", precision: 20, scale: 4, unsigned: true
    t.integer "item_count", null: false, comment: "Line Item Count", unsigned: true
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "reporting_system_updates", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Reporting for system updates", force: :cascade do |t|
    t.string "type", comment: "Update Type"
    t.string "action", comment: "Action Performed"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "reporting_users", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Reporting for user actions", force: :cascade do |t|
    t.string "type", comment: "User Type"
    t.string "action", comment: "Action Performed"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
  end

  create_table "review", primary_key: "review_id", id: { type: :bigint, comment: "Review ID", unsigned: true }, charset: "utf8", comment: "Review base information", force: :cascade do |t|
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Review create date"
    t.integer "entity_id", limit: 2, default: 0, null: false, comment: "Entity ID", unsigned: true
    t.integer "entity_pk_value", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "status_id", limit: 2, default: 0, null: false, comment: "Status code", unsigned: true
    t.index ["entity_id"], name: "REVIEW_ENTITY_ID"
    t.index ["entity_pk_value"], name: "REVIEW_ENTITY_PK_VALUE"
    t.index ["status_id"], name: "REVIEW_STATUS_ID"
  end

  create_table "review_detail", primary_key: "detail_id", id: { type: :bigint, comment: "Review detail ID", unsigned: true }, charset: "utf8", comment: "Review detail information", force: :cascade do |t|
    t.bigint "review_id", default: 0, null: false, comment: "Review ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, comment: "Store ID", unsigned: true
    t.string "title", null: false, comment: "Title"
    t.text "detail", null: false, comment: "Detail description"
    t.string "nickname", limit: 128, null: false, comment: "User nickname"
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.index ["customer_id"], name: "REVIEW_DETAIL_CUSTOMER_ID"
    t.index ["review_id"], name: "REVIEW_DETAIL_REVIEW_ID"
    t.index ["store_id"], name: "REVIEW_DETAIL_STORE_ID"
  end

  create_table "review_entity", primary_key: "entity_id", id: { type: :integer, limit: 2, comment: "Review entity ID", unsigned: true }, charset: "utf8", comment: "Review entities", force: :cascade do |t|
    t.string "entity_code", limit: 32, null: false, comment: "Review entity code"
  end

  create_table "review_entity_summary", primary_key: "primary_id", id: { comment: "Summary review entity ID" }, charset: "utf8", comment: "Review aggregates", force: :cascade do |t|
    t.bigint "entity_pk_value", default: 0, null: false, comment: "Product ID"
    t.integer "entity_type", limit: 2, default: 0, null: false, comment: "Entity type ID"
    t.integer "reviews_count", limit: 2, default: 0, null: false, comment: "Qty of reviews"
    t.integer "rating_summary", limit: 2, default: 0, null: false, comment: "Summarized rating"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.index ["entity_pk_value", "entity_type", "store_id"], name: "amasty_shopby_rating_filter"
    t.index ["entity_pk_value", "store_id", "entity_type"], name: "REVIEW_ENTITY_SUMMARY_ENTITY_PK_VALUE_STORE_ID_ENTITY_TYPE", unique: true
    t.index ["store_id"], name: "REVIEW_ENTITY_SUMMARY_STORE_ID"
  end

  create_table "review_status", primary_key: "status_id", id: { type: :integer, limit: 2, comment: "Status ID", unsigned: true }, charset: "utf8", comment: "Review statuses", force: :cascade do |t|
    t.string "status_code", limit: 32, null: false, comment: "Status code"
  end

  create_table "review_store", primary_key: ["review_id", "store_id"], charset: "utf8", comment: "Review Store", force: :cascade do |t|
    t.bigint "review_id", null: false, comment: "Review ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "REVIEW_STORE_STORE_ID"
  end

  create_table "sales_bestsellers_aggregated_daily", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Bestsellers Aggregated Daily", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.decimal "qty_ordered", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty Ordered"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID"
    t.index ["store_id"], name: "SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID"
  end

  create_table "sales_bestsellers_aggregated_monthly", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Bestsellers Aggregated Monthly", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.decimal "qty_ordered", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty Ordered"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID"
    t.index ["store_id"], name: "SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID"
  end

  create_table "sales_bestsellers_aggregated_yearly", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Bestsellers Aggregated Yearly", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_name", comment: "Product Name"
    t.decimal "product_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Product Price"
    t.decimal "qty_ordered", precision: 12, scale: 4, default: "0.0", null: false, comment: "Qty Ordered"
    t.integer "rating_pos", limit: 2, default: 0, null: false, comment: "Rating Pos", unsigned: true
    t.index ["period", "store_id", "product_id"], name: "SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID", unique: true
    t.index ["product_id"], name: "SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID"
    t.index ["store_id"], name: "SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID"
  end

  create_table "sales_creditmemo", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Creditmemo", force: :cascade do |t|
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.decimal "adjustment_positive", precision: 20, scale: 4, comment: "Adjustment Positive"
    t.decimal "base_shipping_tax_amount", precision: 20, scale: 4, comment: "Base Shipping Tax Amount"
    t.decimal "store_to_order_rate", precision: 20, scale: 4, comment: "Store To Order Rate"
    t.decimal "base_discount_amount", precision: 20, scale: 4, comment: "Base Discount Amount"
    t.decimal "base_to_order_rate", precision: 20, scale: 4, comment: "Base To Order Rate"
    t.decimal "grand_total", precision: 20, scale: 4, comment: "Grand Total"
    t.decimal "base_adjustment_negative", precision: 20, scale: 4, comment: "Base Adjustment Negative"
    t.decimal "base_subtotal_incl_tax", precision: 20, scale: 4, comment: "Base Subtotal Incl Tax"
    t.decimal "shipping_amount", precision: 20, scale: 4, comment: "Shipping Amount"
    t.decimal "subtotal_incl_tax", precision: 20, scale: 4, comment: "Subtotal Incl Tax"
    t.decimal "adjustment_negative", precision: 20, scale: 4, comment: "Adjustment Negative"
    t.decimal "base_shipping_amount", precision: 20, scale: 4, comment: "Base Shipping Amount"
    t.decimal "store_to_base_rate", precision: 20, scale: 4, comment: "Store To Base Rate"
    t.decimal "base_to_global_rate", precision: 20, scale: 4, comment: "Base To Global Rate"
    t.decimal "base_adjustment", precision: 20, scale: 4, comment: "Base Adjustment"
    t.decimal "base_subtotal", precision: 20, scale: 4, comment: "Base Subtotal"
    t.decimal "discount_amount", precision: 20, scale: 4, comment: "Discount Amount"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "adjustment", precision: 20, scale: 4, comment: "Adjustment"
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.decimal "base_adjustment_positive", precision: 20, scale: 4, comment: "Base Adjustment Positive"
    t.decimal "base_tax_amount", precision: 20, scale: 4, comment: "Base Tax Amount"
    t.decimal "shipping_tax_amount", precision: 20, scale: 4, comment: "Shipping Tax Amount"
    t.decimal "tax_amount", precision: 20, scale: 4, comment: "Tax Amount"
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.integer "email_sent", limit: 2, comment: "Email Sent", unsigned: true
    t.integer "send_email", limit: 2, comment: "Send Email", unsigned: true
    t.integer "creditmemo_status", comment: "Creditmemo Status"
    t.integer "state", comment: "State"
    t.integer "shipping_address_id", comment: "Shipping Address ID"
    t.integer "billing_address_id", comment: "Billing Address ID"
    t.integer "invoice_id", comment: "Invoice ID"
    t.string "store_currency_code", limit: 3, comment: "Store Currency Code"
    t.string "order_currency_code", limit: 3, comment: "Order Currency Code"
    t.string "base_currency_code", limit: 3, comment: "Base Currency Code"
    t.string "global_currency_code", limit: 3, comment: "Global Currency Code"
    t.string "transaction_id", comment: "Transaction ID"
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.decimal "shipping_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Shipping Discount Tax Compensation Amount"
    t.decimal "base_shipping_discount_tax_compensation_amnt", precision: 20, scale: 4, comment: "Base Shipping Discount Tax Compensation Amount"
    t.decimal "shipping_incl_tax", precision: 20, scale: 4, comment: "Shipping Incl Tax"
    t.decimal "base_shipping_incl_tax", precision: 20, scale: 4, comment: "Base Shipping Incl Tax"
    t.string "discount_description", comment: "Discount Description"
    t.text "customer_note", comment: "Customer Note"
    t.integer "customer_note_notify", limit: 2, comment: "Customer Note Notify", unsigned: true
    t.decimal "payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee"
    t.decimal "base_payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee"
    t.decimal "payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee Tax"
    t.decimal "base_payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee Tax"
    t.decimal "amstorecredit_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Base Amount"
    t.decimal "amstorecredit_amount", precision: 12, scale: 4, comment: "Amstorecredit Amount"
    t.decimal "bss_giftcard_amount", precision: 12, scale: 4, comment: "Bss Giftcard Amount"
    t.decimal "base_bss_giftcard_amount", precision: 12, scale: 4, comment: "Base Bss Giftcard Amount"
    t.index ["created_at"], name: "SALES_CREDITMEMO_CREATED_AT"
    t.index ["creditmemo_status"], name: "SALES_CREDITMEMO_CREDITMEMO_STATUS"
    t.index ["email_sent"], name: "SALES_CREDITMEMO_EMAIL_SENT"
    t.index ["increment_id", "store_id"], name: "SALES_CREDITMEMO_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_id"], name: "SALES_CREDITMEMO_ORDER_ID"
    t.index ["send_email"], name: "SALES_CREDITMEMO_SEND_EMAIL"
    t.index ["state"], name: "SALES_CREDITMEMO_STATE"
    t.index ["store_id"], name: "SALES_CREDITMEMO_STORE_ID"
    t.index ["updated_at"], name: "SALES_CREDITMEMO_UPDATED_AT"
  end

  create_table "sales_creditmemo_comment", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Creditmemo Comment", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "is_customer_notified", comment: "Is Customer Notified"
    t.integer "is_visible_on_front", limit: 2, default: 0, null: false, comment: "Is Visible On Front", unsigned: true
    t.text "comment", comment: "Comment"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.index ["created_at"], name: "SALES_CREDITMEMO_COMMENT_CREATED_AT"
    t.index ["parent_id"], name: "SALES_CREDITMEMO_COMMENT_PARENT_ID"
  end

  create_table "sales_creditmemo_grid", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "Sales Flat Creditmemo Grid", force: :cascade do |t|
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.timestamp "created_at", comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.string "order_increment_id", limit: 50, comment: "Order Increment ID"
    t.timestamp "order_created_at", comment: "Order Created At"
    t.string "billing_name", comment: "Billing Name"
    t.integer "state", comment: "Status"
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.string "order_status", limit: 32, comment: "Order Status"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "billing_address", comment: "Billing Address"
    t.string "shipping_address", comment: "Shipping Address"
    t.string "customer_name", limit: 128, null: false, comment: "Customer Name"
    t.string "customer_email", limit: 128, comment: "Customer Email"
    t.integer "customer_group_id", limit: 2, comment: "Customer Group ID"
    t.string "payment_method", limit: 32, comment: "Payment Method"
    t.string "shipping_information", comment: "Shipping Method Name"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "shipping_and_handling", precision: 20, scale: 4, comment: "Shipping and handling amount"
    t.decimal "adjustment_positive", precision: 20, scale: 4, comment: "Adjustment Positive"
    t.decimal "adjustment_negative", precision: 20, scale: 4, comment: "Adjustment Negative"
    t.decimal "order_base_grand_total", precision: 20, scale: 4, comment: "Order Grand Total"
    t.index ["base_grand_total"], name: "SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL"
    t.index ["billing_name"], name: "SALES_CREDITMEMO_GRID_BILLING_NAME"
    t.index ["created_at"], name: "SALES_CREDITMEMO_GRID_CREATED_AT"
    t.index ["increment_id", "order_increment_id", "billing_name", "billing_address", "shipping_address", "customer_name", "customer_email"], name: "FTI_32B7BA885941A8254EE84AE650ABDC86", type: :fulltext
    t.index ["increment_id", "store_id"], name: "SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_base_grand_total"], name: "SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL"
    t.index ["order_created_at"], name: "SALES_CREDITMEMO_GRID_ORDER_CREATED_AT"
    t.index ["order_id"], name: "SALES_CREDITMEMO_GRID_ORDER_ID"
    t.index ["order_increment_id"], name: "SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID"
    t.index ["order_status"], name: "SALES_CREDITMEMO_GRID_ORDER_STATUS"
    t.index ["state"], name: "SALES_CREDITMEMO_GRID_STATE"
    t.index ["store_id"], name: "SALES_CREDITMEMO_GRID_STORE_ID"
    t.index ["updated_at"], name: "SALES_CREDITMEMO_GRID_UPDATED_AT"
  end

  create_table "sales_creditmemo_item", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Creditmemo Item", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.decimal "base_price", precision: 12, scale: 4, comment: "Base Price"
    t.decimal "tax_amount", precision: 12, scale: 4, comment: "Tax Amount"
    t.decimal "base_row_total", precision: 12, scale: 4, comment: "Base Row Total"
    t.decimal "discount_amount", precision: 12, scale: 4, comment: "Discount Amount"
    t.decimal "row_total", precision: 12, scale: 4, comment: "Row Total"
    t.decimal "base_discount_amount", precision: 12, scale: 4, comment: "Base Discount Amount"
    t.decimal "price_incl_tax", precision: 12, scale: 4, comment: "Price Incl Tax"
    t.decimal "base_tax_amount", precision: 12, scale: 4, comment: "Base Tax Amount"
    t.decimal "base_price_incl_tax", precision: 12, scale: 4, comment: "Base Price Incl Tax"
    t.decimal "qty", precision: 12, scale: 4, comment: "Qty"
    t.decimal "base_cost", precision: 12, scale: 4, comment: "Base Cost"
    t.decimal "price", precision: 12, scale: 4, comment: "Price"
    t.decimal "base_row_total_incl_tax", precision: 12, scale: 4, comment: "Base Row Total Incl Tax"
    t.decimal "row_total_incl_tax", precision: 12, scale: 4, comment: "Row Total Incl Tax"
    t.integer "product_id", comment: "Product ID"
    t.integer "order_item_id", comment: "Order Item ID"
    t.text "additional_data", comment: "Additional Data"
    t.text "description", comment: "Description"
    t.string "sku", comment: "Sku"
    t.string "name", comment: "Name"
    t.decimal "discount_tax_compensation_amount", precision: 12, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 12, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.text "tax_ratio", comment: "Ratio of tax in the creditmemo item over tax of the order item"
    t.text "weee_tax_applied", comment: "Weee Tax Applied"
    t.decimal "weee_tax_applied_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Amount"
    t.decimal "weee_tax_applied_row_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Row Amount"
    t.decimal "weee_tax_disposition", precision: 12, scale: 4, comment: "Weee Tax Disposition"
    t.decimal "weee_tax_row_disposition", precision: 12, scale: 4, comment: "Weee Tax Row Disposition"
    t.decimal "base_weee_tax_applied_amount", precision: 12, scale: 4, comment: "Base Weee Tax Applied Amount"
    t.decimal "base_weee_tax_applied_row_amnt", precision: 12, scale: 4, comment: "Base Weee Tax Applied Row Amnt"
    t.decimal "base_weee_tax_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Disposition"
    t.decimal "base_weee_tax_row_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Row Disposition"
    t.index ["parent_id"], name: "SALES_CREDITMEMO_ITEM_PARENT_ID"
  end

  create_table "sales_invoice", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Invoice", force: :cascade do |t|
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.decimal "shipping_tax_amount", precision: 20, scale: 4, comment: "Shipping Tax Amount"
    t.decimal "tax_amount", precision: 20, scale: 4, comment: "Tax Amount"
    t.decimal "base_tax_amount", precision: 20, scale: 4, comment: "Base Tax Amount"
    t.decimal "store_to_order_rate", precision: 20, scale: 4, comment: "Store To Order Rate"
    t.decimal "base_shipping_tax_amount", precision: 20, scale: 4, comment: "Base Shipping Tax Amount"
    t.decimal "base_discount_amount", precision: 20, scale: 4, comment: "Base Discount Amount"
    t.decimal "base_to_order_rate", precision: 20, scale: 4, comment: "Base To Order Rate"
    t.decimal "grand_total", precision: 20, scale: 4, comment: "Grand Total"
    t.decimal "shipping_amount", precision: 20, scale: 4, comment: "Shipping Amount"
    t.decimal "subtotal_incl_tax", precision: 20, scale: 4, comment: "Subtotal Incl Tax"
    t.decimal "base_subtotal_incl_tax", precision: 20, scale: 4, comment: "Base Subtotal Incl Tax"
    t.decimal "store_to_base_rate", precision: 20, scale: 4, comment: "Store To Base Rate"
    t.decimal "base_shipping_amount", precision: 20, scale: 4, comment: "Base Shipping Amount"
    t.decimal "total_qty", precision: 12, scale: 4, comment: "Total Qty"
    t.decimal "base_to_global_rate", precision: 20, scale: 4, comment: "Base To Global Rate"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "base_subtotal", precision: 20, scale: 4, comment: "Base Subtotal"
    t.decimal "discount_amount", precision: 20, scale: 4, comment: "Discount Amount"
    t.integer "billing_address_id", comment: "Billing Address ID"
    t.integer "is_used_for_refund", limit: 2, comment: "Is Used For Refund", unsigned: true
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.integer "email_sent", limit: 2, comment: "Email Sent", unsigned: true
    t.integer "send_email", limit: 2, comment: "Send Email", unsigned: true
    t.integer "can_void_flag", limit: 2, comment: "Can Void Flag", unsigned: true
    t.integer "state", comment: "State"
    t.integer "shipping_address_id", comment: "Shipping Address ID"
    t.string "store_currency_code", limit: 3, comment: "Store Currency Code"
    t.string "transaction_id", comment: "Transaction ID"
    t.string "order_currency_code", limit: 3, comment: "Order Currency Code"
    t.string "base_currency_code", limit: 3, comment: "Base Currency Code"
    t.string "global_currency_code", limit: 3, comment: "Global Currency Code"
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.decimal "shipping_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Shipping Discount Tax Compensation Amount"
    t.decimal "base_shipping_discount_tax_compensation_amnt", precision: 20, scale: 4, comment: "Base Shipping Discount Tax Compensation Amount"
    t.decimal "shipping_incl_tax", precision: 20, scale: 4, comment: "Shipping Incl Tax"
    t.decimal "base_shipping_incl_tax", precision: 20, scale: 4, comment: "Base Shipping Incl Tax"
    t.decimal "base_total_refunded", precision: 20, scale: 4, comment: "Base Total Refunded"
    t.string "discount_description", comment: "Discount Description"
    t.text "customer_note", comment: "Customer Note"
    t.integer "customer_note_notify", limit: 2, comment: "Customer Note Notify", unsigned: true
    t.decimal "payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee"
    t.decimal "base_payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee"
    t.decimal "payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee Tax"
    t.decimal "base_payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee Tax"
    t.decimal "amstorecredit_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Base Amount"
    t.decimal "amstorecredit_amount", precision: 12, scale: 4, comment: "Amstorecredit Amount"
    t.decimal "bss_giftcard_amount", precision: 12, scale: 4, comment: "Bss Giftcard Amount"
    t.decimal "base_bss_giftcard_amount", precision: 12, scale: 4, comment: "Base Bss Giftcard Amount"
    t.index ["created_at"], name: "SALES_INVOICE_CREATED_AT"
    t.index ["email_sent"], name: "SALES_INVOICE_EMAIL_SENT"
    t.index ["grand_total"], name: "SALES_INVOICE_GRAND_TOTAL"
    t.index ["increment_id", "store_id"], name: "SALES_INVOICE_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_id"], name: "SALES_INVOICE_ORDER_ID"
    t.index ["send_email"], name: "SALES_INVOICE_SEND_EMAIL"
    t.index ["state"], name: "SALES_INVOICE_STATE"
    t.index ["store_id"], name: "SALES_INVOICE_STORE_ID"
    t.index ["updated_at"], name: "SALES_INVOICE_UPDATED_AT"
  end

  create_table "sales_invoice_comment", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Invoice Comment", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "is_customer_notified", limit: 2, comment: "Is Customer Notified", unsigned: true
    t.integer "is_visible_on_front", limit: 2, default: 0, null: false, comment: "Is Visible On Front", unsigned: true
    t.text "comment", comment: "Comment"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.index ["created_at"], name: "SALES_INVOICE_COMMENT_CREATED_AT"
    t.index ["parent_id"], name: "SALES_INVOICE_COMMENT_PARENT_ID"
  end

  create_table "sales_invoice_grid", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "Sales Flat Invoice Grid", force: :cascade do |t|
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.integer "state", comment: "State"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "store_name", comment: "Store Name"
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.string "order_increment_id", limit: 50, comment: "Order Increment ID"
    t.timestamp "order_created_at", comment: "Order Created At"
    t.string "customer_name", comment: "Customer Name"
    t.string "customer_email", comment: "Customer Email"
    t.integer "customer_group_id"
    t.string "payment_method", limit: 128, comment: "Payment Method"
    t.string "store_currency_code", limit: 3, comment: "Store Currency Code"
    t.string "order_currency_code", limit: 3, comment: "Order Currency Code"
    t.string "base_currency_code", limit: 3, comment: "Base Currency Code"
    t.string "global_currency_code", limit: 3, comment: "Global Currency Code"
    t.string "billing_name", comment: "Billing Name"
    t.string "billing_address", comment: "Billing Address"
    t.string "shipping_address", comment: "Shipping Address"
    t.string "shipping_information", comment: "Shipping Method Name"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "shipping_and_handling", precision: 20, scale: 4, comment: "Shipping and handling amount"
    t.decimal "grand_total", precision: 20, scale: 4, comment: "Grand Total"
    t.timestamp "created_at", comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.index ["base_grand_total"], name: "SALES_INVOICE_GRID_BASE_GRAND_TOTAL"
    t.index ["billing_name"], name: "SALES_INVOICE_GRID_BILLING_NAME"
    t.index ["created_at"], name: "SALES_INVOICE_GRID_CREATED_AT"
    t.index ["grand_total"], name: "SALES_INVOICE_GRID_GRAND_TOTAL"
    t.index ["increment_id", "order_increment_id", "billing_name", "billing_address", "shipping_address", "customer_name", "customer_email"], name: "FTI_95D9C924DD6A8734EB8B5D01D60F90DE", type: :fulltext
    t.index ["increment_id", "store_id"], name: "SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_created_at"], name: "SALES_INVOICE_GRID_ORDER_CREATED_AT"
    t.index ["order_id"], name: "SALES_INVOICE_GRID_ORDER_ID"
    t.index ["order_increment_id"], name: "SALES_INVOICE_GRID_ORDER_INCREMENT_ID"
    t.index ["state"], name: "SALES_INVOICE_GRID_STATE"
    t.index ["store_id"], name: "SALES_INVOICE_GRID_STORE_ID"
    t.index ["updated_at"], name: "SALES_INVOICE_GRID_UPDATED_AT"
  end

  create_table "sales_invoice_item", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Invoice Item", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.decimal "base_price", precision: 12, scale: 4, comment: "Base Price"
    t.decimal "tax_amount", precision: 12, scale: 4, comment: "Tax Amount"
    t.decimal "base_row_total", precision: 20, scale: 4, comment: "Base Row Total"
    t.decimal "discount_amount", precision: 12, scale: 4, comment: "Discount Amount"
    t.decimal "row_total", precision: 20, scale: 4, comment: "Row Total"
    t.decimal "base_discount_amount", precision: 12, scale: 4, comment: "Base Discount Amount"
    t.decimal "price_incl_tax", precision: 12, scale: 4, comment: "Price Incl Tax"
    t.decimal "base_tax_amount", precision: 12, scale: 4, comment: "Base Tax Amount"
    t.decimal "base_price_incl_tax", precision: 12, scale: 4, comment: "Base Price Incl Tax"
    t.decimal "qty", precision: 12, scale: 4, comment: "Qty"
    t.decimal "base_cost", precision: 12, scale: 4, comment: "Base Cost"
    t.decimal "price", precision: 12, scale: 4, comment: "Price"
    t.decimal "base_row_total_incl_tax", precision: 12, scale: 4, comment: "Base Row Total Incl Tax"
    t.decimal "row_total_incl_tax", precision: 12, scale: 4, comment: "Row Total Incl Tax"
    t.integer "product_id", comment: "Product ID"
    t.integer "order_item_id", comment: "Order Item ID"
    t.text "additional_data", comment: "Additional Data"
    t.text "description", comment: "Description"
    t.string "sku", comment: "Sku"
    t.string "name", comment: "Name"
    t.decimal "discount_tax_compensation_amount", precision: 12, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 12, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.text "tax_ratio", comment: "Ratio of tax invoiced over tax of the order item"
    t.text "weee_tax_applied", comment: "Weee Tax Applied"
    t.decimal "weee_tax_applied_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Amount"
    t.decimal "weee_tax_applied_row_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Row Amount"
    t.decimal "weee_tax_disposition", precision: 12, scale: 4, comment: "Weee Tax Disposition"
    t.decimal "weee_tax_row_disposition", precision: 12, scale: 4, comment: "Weee Tax Row Disposition"
    t.decimal "base_weee_tax_applied_amount", precision: 12, scale: 4, comment: "Base Weee Tax Applied Amount"
    t.decimal "base_weee_tax_applied_row_amnt", precision: 12, scale: 4, comment: "Base Weee Tax Applied Row Amnt"
    t.decimal "base_weee_tax_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Disposition"
    t.decimal "base_weee_tax_row_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Row Disposition"
    t.index ["parent_id"], name: "SALES_INVOICE_ITEM_PARENT_ID"
  end

  create_table "sales_invoiced_aggregated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Invoiced Aggregated", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "orders_invoiced", precision: 12, scale: 4, comment: "Orders Invoiced"
    t.decimal "invoiced", precision: 12, scale: 4, comment: "Invoiced"
    t.decimal "invoiced_captured", precision: 12, scale: 4, comment: "Invoiced Captured"
    t.decimal "invoiced_not_captured", precision: 12, scale: 4, comment: "Invoiced Not Captured"
    t.index ["period", "store_id", "order_status"], name: "SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_INVOICED_AGGREGATED_STORE_ID"
  end

  create_table "sales_invoiced_aggregated_order", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Invoiced Aggregated Order", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "orders_invoiced", precision: 12, scale: 4, comment: "Orders Invoiced"
    t.decimal "invoiced", precision: 12, scale: 4, comment: "Invoiced"
    t.decimal "invoiced_captured", precision: 12, scale: 4, comment: "Invoiced Captured"
    t.decimal "invoiced_not_captured", precision: 12, scale: 4, comment: "Invoiced Not Captured"
    t.index ["period", "store_id", "order_status"], name: "SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_INVOICED_AGGREGATED_ORDER_STORE_ID"
  end

  create_table "sales_order", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Order", force: :cascade do |t|
    t.string "state", limit: 32, comment: "State"
    t.string "status", limit: 32, comment: "Status"
    t.string "coupon_code", comment: "Coupon Code"
    t.string "protect_code", comment: "Protect Code"
    t.string "shipping_description", comment: "Shipping Description"
    t.integer "is_virtual", limit: 2, comment: "Is Virtual", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.decimal "base_discount_amount", precision: 20, scale: 4, comment: "Base Discount Amount"
    t.decimal "base_discount_canceled", precision: 20, scale: 4, comment: "Base Discount Canceled"
    t.decimal "base_discount_invoiced", precision: 20, scale: 4, comment: "Base Discount Invoiced"
    t.decimal "base_discount_refunded", precision: 20, scale: 4, comment: "Base Discount Refunded"
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.decimal "base_shipping_amount", precision: 20, scale: 4, comment: "Base Shipping Amount"
    t.decimal "base_shipping_canceled", precision: 20, scale: 4, comment: "Base Shipping Canceled"
    t.decimal "base_shipping_invoiced", precision: 20, scale: 4, comment: "Base Shipping Invoiced"
    t.decimal "base_shipping_refunded", precision: 20, scale: 4, comment: "Base Shipping Refunded"
    t.decimal "base_shipping_tax_amount", precision: 20, scale: 4, comment: "Base Shipping Tax Amount"
    t.decimal "base_shipping_tax_refunded", precision: 20, scale: 4, comment: "Base Shipping Tax Refunded"
    t.decimal "base_subtotal", precision: 20, scale: 4, comment: "Base Subtotal"
    t.decimal "base_subtotal_canceled", precision: 20, scale: 4, comment: "Base Subtotal Canceled"
    t.decimal "base_subtotal_invoiced", precision: 20, scale: 4, comment: "Base Subtotal Invoiced"
    t.decimal "base_subtotal_refunded", precision: 20, scale: 4, comment: "Base Subtotal Refunded"
    t.decimal "base_tax_amount", precision: 20, scale: 4, comment: "Base Tax Amount"
    t.decimal "base_tax_canceled", precision: 20, scale: 4, comment: "Base Tax Canceled"
    t.decimal "base_tax_invoiced", precision: 20, scale: 4, comment: "Base Tax Invoiced"
    t.decimal "base_tax_refunded", precision: 20, scale: 4, comment: "Base Tax Refunded"
    t.decimal "base_to_global_rate", precision: 20, scale: 4, comment: "Base To Global Rate"
    t.decimal "base_to_order_rate", precision: 20, scale: 4, comment: "Base To Order Rate"
    t.decimal "base_total_canceled", precision: 20, scale: 4, comment: "Base Total Canceled"
    t.decimal "base_total_invoiced", precision: 20, scale: 4, comment: "Base Total Invoiced"
    t.decimal "base_total_invoiced_cost", precision: 20, scale: 4, comment: "Base Total Invoiced Cost"
    t.decimal "base_total_offline_refunded", precision: 20, scale: 4, comment: "Base Total Offline Refunded"
    t.decimal "base_total_online_refunded", precision: 20, scale: 4, comment: "Base Total Online Refunded"
    t.decimal "base_total_paid", precision: 20, scale: 4, comment: "Base Total Paid"
    t.decimal "base_total_qty_ordered", precision: 12, scale: 4, comment: "Base Total Qty Ordered"
    t.decimal "base_total_refunded", precision: 20, scale: 4, comment: "Base Total Refunded"
    t.decimal "discount_amount", precision: 20, scale: 4, comment: "Discount Amount"
    t.decimal "discount_canceled", precision: 20, scale: 4, comment: "Discount Canceled"
    t.decimal "discount_invoiced", precision: 20, scale: 4, comment: "Discount Invoiced"
    t.decimal "discount_refunded", precision: 20, scale: 4, comment: "Discount Refunded"
    t.decimal "grand_total", precision: 20, scale: 4, comment: "Grand Total"
    t.decimal "shipping_amount", precision: 20, scale: 4, comment: "Shipping Amount"
    t.decimal "shipping_canceled", precision: 20, scale: 4, comment: "Shipping Canceled"
    t.decimal "shipping_invoiced", precision: 20, scale: 4, comment: "Shipping Invoiced"
    t.decimal "shipping_refunded", precision: 20, scale: 4, comment: "Shipping Refunded"
    t.decimal "shipping_tax_amount", precision: 20, scale: 4, comment: "Shipping Tax Amount"
    t.decimal "shipping_tax_refunded", precision: 20, scale: 4, comment: "Shipping Tax Refunded"
    t.decimal "store_to_base_rate", precision: 12, scale: 4, comment: "Store To Base Rate"
    t.decimal "store_to_order_rate", precision: 12, scale: 4, comment: "Store To Order Rate"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "subtotal_canceled", precision: 20, scale: 4, comment: "Subtotal Canceled"
    t.decimal "subtotal_invoiced", precision: 20, scale: 4, comment: "Subtotal Invoiced"
    t.decimal "subtotal_refunded", precision: 20, scale: 4, comment: "Subtotal Refunded"
    t.decimal "tax_amount", precision: 20, scale: 4, comment: "Tax Amount"
    t.decimal "tax_canceled", precision: 20, scale: 4, comment: "Tax Canceled"
    t.decimal "tax_invoiced", precision: 20, scale: 4, comment: "Tax Invoiced"
    t.decimal "tax_refunded", precision: 20, scale: 4, comment: "Tax Refunded"
    t.decimal "total_canceled", precision: 20, scale: 4, comment: "Total Canceled"
    t.decimal "total_invoiced", precision: 20, scale: 4, comment: "Total Invoiced"
    t.decimal "total_offline_refunded", precision: 20, scale: 4, comment: "Total Offline Refunded"
    t.decimal "total_online_refunded", precision: 20, scale: 4, comment: "Total Online Refunded"
    t.decimal "total_paid", precision: 20, scale: 4, comment: "Total Paid"
    t.decimal "total_qty_ordered", precision: 12, scale: 4, comment: "Total Qty Ordered"
    t.decimal "total_refunded", precision: 20, scale: 4, comment: "Total Refunded"
    t.integer "can_ship_partially", limit: 2, comment: "Can Ship Partially", unsigned: true
    t.integer "can_ship_partially_item", limit: 2, comment: "Can Ship Partially Item", unsigned: true
    t.integer "customer_is_guest", limit: 2, comment: "Customer Is Guest", unsigned: true
    t.integer "customer_note_notify", limit: 2, comment: "Customer Note Notify", unsigned: true
    t.integer "billing_address_id", comment: "Billing Address ID"
    t.integer "customer_group_id"
    t.integer "edit_increment", comment: "Edit Increment"
    t.integer "email_sent", limit: 2, comment: "Email Sent", unsigned: true
    t.integer "send_email", limit: 2, comment: "Send Email", unsigned: true
    t.integer "forced_shipment_with_invoice", limit: 2, comment: "Forced Do Shipment With Invoice", unsigned: true
    t.integer "payment_auth_expiration", comment: "Payment Authorization Expiration"
    t.integer "quote_address_id", comment: "Quote Address ID"
    t.integer "quote_id", comment: "Quote ID"
    t.integer "shipping_address_id", comment: "Shipping Address ID"
    t.decimal "adjustment_negative", precision: 20, scale: 4, comment: "Adjustment Negative"
    t.decimal "adjustment_positive", precision: 20, scale: 4, comment: "Adjustment Positive"
    t.decimal "base_adjustment_negative", precision: 20, scale: 4, comment: "Base Adjustment Negative"
    t.decimal "base_adjustment_positive", precision: 20, scale: 4, comment: "Base Adjustment Positive"
    t.decimal "base_shipping_discount_amount", precision: 20, scale: 4, comment: "Base Shipping Discount Amount"
    t.decimal "base_subtotal_incl_tax", precision: 20, scale: 4, comment: "Base Subtotal Incl Tax"
    t.decimal "base_total_due", precision: 20, scale: 4, comment: "Base Total Due"
    t.decimal "payment_authorization_amount", precision: 20, scale: 4, comment: "Payment Authorization Amount"
    t.decimal "shipping_discount_amount", precision: 20, scale: 4, comment: "Shipping Discount Amount"
    t.decimal "subtotal_incl_tax", precision: 20, scale: 4, comment: "Subtotal Incl Tax"
    t.decimal "total_due", precision: 20, scale: 4, comment: "Total Due"
    t.decimal "weight", precision: 12, scale: 4, comment: "Weight"
    t.datetime "customer_dob", comment: "Customer Dob"
    t.string "increment_id", limit: 32, comment: "Increment ID"
    t.string "applied_rule_ids", limit: 128, comment: "Applied Rule Ids"
    t.string "base_currency_code", limit: 3, comment: "Base Currency Code"
    t.string "customer_email", limit: 128, comment: "Customer Email"
    t.string "customer_firstname", limit: 128, comment: "Customer Firstname"
    t.string "customer_lastname", limit: 128, comment: "Customer Lastname"
    t.string "customer_middlename", limit: 128, comment: "Customer Middlename"
    t.string "customer_prefix", limit: 32, comment: "Customer Prefix"
    t.string "customer_suffix", limit: 32, comment: "Customer Suffix"
    t.string "customer_taxvat", limit: 32, comment: "Customer Taxvat"
    t.string "discount_description", comment: "Discount Description"
    t.string "ext_customer_id", limit: 32, comment: "Ext Customer ID"
    t.string "ext_order_id", limit: 32, comment: "Ext Order ID"
    t.string "global_currency_code", limit: 3, comment: "Global Currency Code"
    t.string "hold_before_state", limit: 32, comment: "Hold Before State"
    t.string "hold_before_status", limit: 32, comment: "Hold Before Status"
    t.string "order_currency_code", limit: 3, comment: "Order Currency Code"
    t.string "original_increment_id", limit: 32, comment: "Original Increment ID"
    t.string "relation_child_id", limit: 32, comment: "Relation Child ID"
    t.string "relation_child_real_id", limit: 32, comment: "Relation Child Real ID"
    t.string "relation_parent_id", limit: 32, comment: "Relation Parent ID"
    t.string "relation_parent_real_id", limit: 32, comment: "Relation Parent Real ID"
    t.string "remote_ip", limit: 45, comment: "Remote Ip"
    t.string "shipping_method", limit: 120
    t.string "store_currency_code", limit: 3, comment: "Store Currency Code"
    t.string "store_name", comment: "Store Name"
    t.string "x_forwarded_for", comment: "X Forwarded For"
    t.text "customer_note", comment: "Customer Note"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "total_item_count", limit: 2, default: 0, null: false, comment: "Total Item Count", unsigned: true
    t.integer "customer_gender", comment: "Customer Gender"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.decimal "shipping_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Shipping Discount Tax Compensation Amount"
    t.decimal "base_shipping_discount_tax_compensation_amnt", precision: 20, scale: 4, comment: "Base Shipping Discount Tax Compensation Amount"
    t.decimal "discount_tax_compensation_invoiced", precision: 20, scale: 4, comment: "Discount Tax Compensation Invoiced"
    t.decimal "base_discount_tax_compensation_invoiced", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Invoiced"
    t.decimal "discount_tax_compensation_refunded", precision: 20, scale: 4, comment: "Discount Tax Compensation Refunded"
    t.decimal "base_discount_tax_compensation_refunded", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Refunded"
    t.decimal "shipping_incl_tax", precision: 20, scale: 4, comment: "Shipping Incl Tax"
    t.decimal "base_shipping_incl_tax", precision: 20, scale: 4, comment: "Base Shipping Incl Tax"
    t.string "coupon_rule_name", comment: "Coupon Sales Rule Name"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "paypal_ipn_customer_notified", default: 0, comment: "Paypal Ipn Customer Notified"
    t.decimal "payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee"
    t.decimal "base_payment_fee", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee"
    t.decimal "payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Payment Fee Tax"
    t.decimal "base_payment_fee_tax", precision: 12, scale: 4, default: "0.0", comment: "Base Payment Fee Tax"
    t.decimal "amstorecredit_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Base Amount"
    t.decimal "amstorecredit_amount", precision: 12, scale: 4, comment: "Amstorecredit Amount"
    t.decimal "amstorecredit_invoiced_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Invoiced Base Amount"
    t.decimal "amstorecredit_invoiced_amount", precision: 12, scale: 4, comment: "Amstorecredit Invoiced Amount"
    t.decimal "amstorecredit_refunded_base_amount", precision: 12, scale: 4, comment: "Amstorecredit Refunded Base Amount"
    t.decimal "amstorecredit_refunded_amount", precision: 12, scale: 4, comment: "Amstorecredit Refunded Amount"
    t.decimal "bss_giftcard_amount", precision: 12, scale: 4, comment: "Bss Giftcard Amount"
    t.decimal "base_bss_giftcard_amount", precision: 12, scale: 4, comment: "Base Bss Giftcard Amount"
    t.integer "order_approval_status", limit: 2, default: 0, null: false, comment: "Order Approval Status", unsigned: true
    t.integer "mp_smtp_email_marketing_synced", limit: 2, default: 0, comment: "Mp SMTP Email Marketing synced"
    t.index ["created_at"], name: "SALES_ORDER_CREATED_AT"
    t.index ["customer_id"], name: "SALES_ORDER_CUSTOMER_ID"
    t.index ["email_sent"], name: "SALES_ORDER_EMAIL_SENT"
    t.index ["ext_order_id"], name: "SALES_ORDER_EXT_ORDER_ID"
    t.index ["increment_id", "store_id"], name: "SALES_ORDER_INCREMENT_ID_STORE_ID", unique: true
    t.index ["quote_id"], name: "SALES_ORDER_QUOTE_ID"
    t.index ["send_email"], name: "SALES_ORDER_SEND_EMAIL"
    t.index ["state"], name: "SALES_ORDER_STATE"
    t.index ["status"], name: "SALES_ORDER_STATUS"
    t.index ["store_id"], name: "SALES_ORDER_STORE_ID"
    t.index ["updated_at"], name: "SALES_ORDER_UPDATED_AT"
  end

  create_table "sales_order_address", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Order Address", force: :cascade do |t|
    t.integer "parent_id", comment: "Parent ID", unsigned: true
    t.integer "customer_address_id", comment: "Customer Address ID"
    t.integer "quote_address_id", comment: "Quote Address ID"
    t.integer "region_id", comment: "Region ID"
    t.integer "customer_id", comment: "Customer ID"
    t.string "fax", comment: "Fax"
    t.string "region", comment: "Region"
    t.string "postcode", comment: "Postcode"
    t.string "lastname", comment: "Lastname"
    t.string "street", comment: "Street"
    t.string "city", comment: "City"
    t.string "email", comment: "Email"
    t.string "telephone", comment: "Phone Number"
    t.string "country_id", limit: 2, comment: "Country ID"
    t.string "firstname", comment: "Firstname"
    t.string "address_type", comment: "Address Type"
    t.string "prefix", comment: "Prefix"
    t.string "middlename", comment: "Middlename"
    t.string "suffix", comment: "Suffix"
    t.string "company", comment: "Company"
    t.text "vat_id", comment: "Vat ID"
    t.integer "vat_is_valid", limit: 2, comment: "Vat Is Valid"
    t.text "vat_request_id", comment: "Vat Request ID"
    t.text "vat_request_date", comment: "Vat Request Date"
    t.integer "vat_request_success", limit: 2, comment: "Vat Request Success"
    t.string "vertex_vat_country_code", comment: "Vertex Customer Vat Country"
    t.index ["parent_id"], name: "SALES_ORDER_ADDRESS_PARENT_ID"
  end

  create_table "sales_order_aggregated_created", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Order Aggregated Created", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "total_qty_ordered", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Qty Ordered"
    t.decimal "total_qty_invoiced", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Qty Invoiced"
    t.decimal "total_income_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Income Amount"
    t.decimal "total_revenue_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Revenue Amount"
    t.decimal "total_profit_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Profit Amount"
    t.decimal "total_invoiced_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Invoiced Amount"
    t.decimal "total_canceled_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Canceled Amount"
    t.decimal "total_paid_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Paid Amount"
    t.decimal "total_refunded_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Refunded Amount"
    t.decimal "total_tax_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Tax Amount"
    t.decimal "total_tax_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Tax Amount Actual"
    t.decimal "total_shipping_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Shipping Amount"
    t.decimal "total_shipping_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Shipping Amount Actual"
    t.decimal "total_discount_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Discount Amount"
    t.decimal "total_discount_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Discount Amount Actual"
    t.index ["period", "store_id", "order_status"], name: "SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_ORDER_AGGREGATED_CREATED_STORE_ID"
  end

  create_table "sales_order_aggregated_updated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Order Aggregated Updated", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "total_qty_ordered", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Qty Ordered"
    t.decimal "total_qty_invoiced", precision: 12, scale: 4, default: "0.0", null: false, comment: "Total Qty Invoiced"
    t.decimal "total_income_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Income Amount"
    t.decimal "total_revenue_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Revenue Amount"
    t.decimal "total_profit_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Profit Amount"
    t.decimal "total_invoiced_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Invoiced Amount"
    t.decimal "total_canceled_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Canceled Amount"
    t.decimal "total_paid_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Paid Amount"
    t.decimal "total_refunded_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Refunded Amount"
    t.decimal "total_tax_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Tax Amount"
    t.decimal "total_tax_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Tax Amount Actual"
    t.decimal "total_shipping_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Shipping Amount"
    t.decimal "total_shipping_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Shipping Amount Actual"
    t.decimal "total_discount_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Discount Amount"
    t.decimal "total_discount_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Discount Amount Actual"
    t.index ["period", "store_id", "order_status"], name: "SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_ORDER_AGGREGATED_UPDATED_STORE_ID"
  end

  create_table "sales_order_grid", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "Sales Flat Order Grid", force: :cascade do |t|
    t.string "status", limit: 32, comment: "Status"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "store_name", comment: "Store Name"
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.decimal "base_grand_total", precision: 20, scale: 4, comment: "Base Grand Total"
    t.decimal "base_total_paid", precision: 20, scale: 4, comment: "Base Total Paid"
    t.decimal "grand_total", precision: 20, scale: 4, comment: "Grand Total"
    t.decimal "total_paid", precision: 20, scale: 4, comment: "Total Paid"
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.string "base_currency_code", limit: 3, comment: "Base Currency Code"
    t.string "order_currency_code", comment: "Order Currency Code"
    t.string "shipping_name", comment: "Shipping Name"
    t.string "billing_name", comment: "Billing Name"
    t.timestamp "created_at", comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.string "billing_address", comment: "Billing Address"
    t.string "shipping_address", comment: "Shipping Address"
    t.string "shipping_information", comment: "Shipping Method Name"
    t.string "customer_email", comment: "Customer Email"
    t.string "customer_group", comment: "Customer Group"
    t.decimal "subtotal", precision: 20, scale: 4, comment: "Subtotal"
    t.decimal "shipping_and_handling", precision: 20, scale: 4, comment: "Shipping and handling amount"
    t.string "customer_name", comment: "Customer Name"
    t.string "payment_method", comment: "Payment Method"
    t.decimal "total_refunded", precision: 20, scale: 4, comment: "Total Refunded"
    t.string "signifyd_guarantee_status", limit: 32, comment: "Signifyd Guarantee Disposition Status"
    t.string "pickup_location_code", comment: "Pickup Location Code"
    t.decimal "amstorecredit_refunded_amount", precision: 12, scale: 4, comment: "Amstorecredit Refunded Amount"
    t.integer "order_approval_status", limit: 2, default: 0, null: false, comment: "Order Approval Status", unsigned: true
    t.index ["base_grand_total"], name: "SALES_ORDER_GRID_BASE_GRAND_TOTAL"
    t.index ["base_total_paid"], name: "SALES_ORDER_GRID_BASE_TOTAL_PAID"
    t.index ["billing_name"], name: "SALES_ORDER_GRID_BILLING_NAME"
    t.index ["created_at"], name: "SALES_ORDER_GRID_CREATED_AT"
    t.index ["customer_id"], name: "SALES_ORDER_GRID_CUSTOMER_ID"
    t.index ["grand_total"], name: "SALES_ORDER_GRID_GRAND_TOTAL"
    t.index ["increment_id", "billing_name", "shipping_name", "shipping_address", "billing_address", "customer_name", "customer_email"], name: "FTI_65B9E9925EC58F0C7C2E2F6379C233E7", type: :fulltext
    t.index ["increment_id", "store_id"], name: "SALES_ORDER_GRID_INCREMENT_ID_STORE_ID", unique: true
    t.index ["pickup_location_code"], name: "SALES_ORDER_GRID_PICKUP_LOCATION_CODE"
    t.index ["shipping_name"], name: "SALES_ORDER_GRID_SHIPPING_NAME"
    t.index ["status"], name: "SALES_ORDER_GRID_STATUS"
    t.index ["store_id"], name: "SALES_ORDER_GRID_STORE_ID"
    t.index ["total_paid"], name: "SALES_ORDER_GRID_TOTAL_PAID"
    t.index ["updated_at"], name: "SALES_ORDER_GRID_UPDATED_AT"
  end

  create_table "sales_order_item", primary_key: "item_id", id: { type: :integer, comment: "Item ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Order Item", force: :cascade do |t|
    t.integer "order_id", default: 0, null: false, comment: "Order ID", unsigned: true
    t.integer "parent_item_id", comment: "Parent Item ID", unsigned: true
    t.integer "quote_item_id", comment: "Quote Item ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.integer "product_id", comment: "Product ID", unsigned: true
    t.string "product_type", comment: "Product Type"
    t.text "product_options", comment: "Product Options"
    t.decimal "weight", precision: 12, scale: 4, default: "0.0", comment: "Weight"
    t.integer "is_virtual", limit: 2, comment: "Is Virtual", unsigned: true
    t.string "sku", comment: "Sku"
    t.string "name", comment: "Name"
    t.text "description", comment: "Description"
    t.text "applied_rule_ids", comment: "Applied Rule Ids"
    t.text "additional_data", comment: "Additional Data"
    t.integer "is_qty_decimal", limit: 2, comment: "Is Qty Decimal", unsigned: true
    t.integer "no_discount", limit: 2, default: 0, null: false, comment: "No Discount", unsigned: true
    t.decimal "qty_backordered", precision: 12, scale: 4, default: "0.0", comment: "Qty Backordered"
    t.decimal "qty_canceled", precision: 12, scale: 4, default: "0.0", comment: "Qty Canceled"
    t.decimal "qty_invoiced", precision: 12, scale: 4, default: "0.0", comment: "Qty Invoiced"
    t.decimal "qty_ordered", precision: 12, scale: 4, default: "0.0", comment: "Qty Ordered"
    t.decimal "qty_refunded", precision: 12, scale: 4, default: "0.0", comment: "Qty Refunded"
    t.decimal "qty_shipped", precision: 12, scale: 4, default: "0.0", comment: "Qty Shipped"
    t.decimal "base_cost", precision: 12, scale: 4, default: "0.0", comment: "Base Cost"
    t.decimal "price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Price"
    t.decimal "base_price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Base Price"
    t.decimal "original_price", precision: 12, scale: 4, comment: "Original Price"
    t.decimal "base_original_price", precision: 12, scale: 4, comment: "Base Original Price"
    t.decimal "tax_percent", precision: 12, scale: 4, default: "0.0", comment: "Tax Percent"
    t.decimal "tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Tax Amount"
    t.decimal "base_tax_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Tax Amount"
    t.decimal "tax_invoiced", precision: 20, scale: 4, default: "0.0", comment: "Tax Invoiced"
    t.decimal "base_tax_invoiced", precision: 20, scale: 4, default: "0.0", comment: "Base Tax Invoiced"
    t.decimal "discount_percent", precision: 12, scale: 4, default: "0.0", comment: "Discount Percent"
    t.decimal "discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Discount Amount"
    t.decimal "base_discount_amount", precision: 20, scale: 4, default: "0.0", comment: "Base Discount Amount"
    t.decimal "discount_invoiced", precision: 20, scale: 4, default: "0.0", comment: "Discount Invoiced"
    t.decimal "base_discount_invoiced", precision: 20, scale: 4, default: "0.0", comment: "Base Discount Invoiced"
    t.decimal "amount_refunded", precision: 20, scale: 4, default: "0.0", comment: "Amount Refunded"
    t.decimal "base_amount_refunded", precision: 20, scale: 4, default: "0.0", comment: "Base Amount Refunded"
    t.decimal "row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Row Total"
    t.decimal "base_row_total", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Row Total"
    t.decimal "row_invoiced", precision: 20, scale: 4, default: "0.0", null: false, comment: "Row Invoiced"
    t.decimal "base_row_invoiced", precision: 20, scale: 4, default: "0.0", null: false, comment: "Base Row Invoiced"
    t.decimal "row_weight", precision: 12, scale: 4, default: "0.0", comment: "Row Weight"
    t.decimal "base_tax_before_discount", precision: 20, scale: 4, comment: "Base Tax Before Discount"
    t.decimal "tax_before_discount", precision: 20, scale: 4, comment: "Tax Before Discount"
    t.string "ext_order_item_id", comment: "Ext Order Item ID"
    t.integer "locked_do_invoice", limit: 2, comment: "Locked Do Invoice", unsigned: true
    t.integer "locked_do_ship", limit: 2, comment: "Locked Do Ship", unsigned: true
    t.decimal "price_incl_tax", precision: 20, scale: 4, comment: "Price Incl Tax"
    t.decimal "base_price_incl_tax", precision: 20, scale: 4, comment: "Base Price Incl Tax"
    t.decimal "row_total_incl_tax", precision: 20, scale: 4, comment: "Row Total Incl Tax"
    t.decimal "base_row_total_incl_tax", precision: 20, scale: 4, comment: "Base Row Total Incl Tax"
    t.decimal "discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Discount Tax Compensation Amount"
    t.decimal "base_discount_tax_compensation_amount", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Amount"
    t.decimal "discount_tax_compensation_invoiced", precision: 20, scale: 4, comment: "Discount Tax Compensation Invoiced"
    t.decimal "base_discount_tax_compensation_invoiced", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Invoiced"
    t.decimal "discount_tax_compensation_refunded", precision: 20, scale: 4, comment: "Discount Tax Compensation Refunded"
    t.decimal "base_discount_tax_compensation_refunded", precision: 20, scale: 4, comment: "Base Discount Tax Compensation Refunded"
    t.decimal "tax_canceled", precision: 12, scale: 4, comment: "Tax Canceled"
    t.decimal "discount_tax_compensation_canceled", precision: 20, scale: 4, comment: "Discount Tax Compensation Canceled"
    t.decimal "tax_refunded", precision: 20, scale: 4, comment: "Tax Refunded"
    t.decimal "base_tax_refunded", precision: 20, scale: 4, comment: "Base Tax Refunded"
    t.decimal "discount_refunded", precision: 20, scale: 4, comment: "Discount Refunded"
    t.decimal "base_discount_refunded", precision: 20, scale: 4, comment: "Base Discount Refunded"
    t.integer "gift_message_id", comment: "Gift Message ID"
    t.integer "gift_message_available", comment: "Gift Message Available"
    t.integer "free_shipping", limit: 2, default: 0, null: false, comment: "Free Shipping", unsigned: true
    t.text "weee_tax_applied", comment: "Weee Tax Applied"
    t.decimal "weee_tax_applied_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Amount"
    t.decimal "weee_tax_applied_row_amount", precision: 12, scale: 4, comment: "Weee Tax Applied Row Amount"
    t.decimal "weee_tax_disposition", precision: 12, scale: 4, comment: "Weee Tax Disposition"
    t.decimal "weee_tax_row_disposition", precision: 12, scale: 4, comment: "Weee Tax Row Disposition"
    t.decimal "base_weee_tax_applied_amount", precision: 12, scale: 4, comment: "Base Weee Tax Applied Amount"
    t.decimal "base_weee_tax_applied_row_amnt", precision: 12, scale: 4, comment: "Base Weee Tax Applied Row Amnt"
    t.decimal "base_weee_tax_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Disposition"
    t.decimal "base_weee_tax_row_disposition", precision: 12, scale: 4, comment: "Base Weee Tax Row Disposition"
    t.index ["order_id"], name: "SALES_ORDER_ITEM_ORDER_ID"
    t.index ["store_id"], name: "SALES_ORDER_ITEM_STORE_ID"
  end

  create_table "sales_order_payment", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Order Payment", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.decimal "base_shipping_captured", precision: 20, scale: 4, comment: "Base Shipping Captured"
    t.decimal "shipping_captured", precision: 20, scale: 4, comment: "Shipping Captured"
    t.decimal "amount_refunded", precision: 20, scale: 4, comment: "Amount Refunded"
    t.decimal "base_amount_paid", precision: 20, scale: 4, comment: "Base Amount Paid"
    t.decimal "amount_canceled", precision: 20, scale: 4, comment: "Amount Canceled"
    t.decimal "base_amount_authorized", precision: 20, scale: 4, comment: "Base Amount Authorized"
    t.decimal "base_amount_paid_online", precision: 20, scale: 4, comment: "Base Amount Paid Online"
    t.decimal "base_amount_refunded_online", precision: 20, scale: 4, comment: "Base Amount Refunded Online"
    t.decimal "base_shipping_amount", precision: 20, scale: 4, comment: "Base Shipping Amount"
    t.decimal "shipping_amount", precision: 20, scale: 4, comment: "Shipping Amount"
    t.decimal "amount_paid", precision: 20, scale: 4, comment: "Amount Paid"
    t.decimal "amount_authorized", precision: 20, scale: 4, comment: "Amount Authorized"
    t.decimal "base_amount_ordered", precision: 20, scale: 4, comment: "Base Amount Ordered"
    t.decimal "base_shipping_refunded", precision: 20, scale: 4, comment: "Base Shipping Refunded"
    t.decimal "shipping_refunded", precision: 20, scale: 4, comment: "Shipping Refunded"
    t.decimal "base_amount_refunded", precision: 20, scale: 4, comment: "Base Amount Refunded"
    t.decimal "amount_ordered", precision: 20, scale: 4, comment: "Amount Ordered"
    t.decimal "base_amount_canceled", precision: 20, scale: 4, comment: "Base Amount Canceled"
    t.integer "quote_payment_id", comment: "Quote Payment ID"
    t.text "additional_data", comment: "Additional Data"
    t.string "cc_exp_month", limit: 12, comment: "Cc Exp Month"
    t.string "cc_ss_start_year", limit: 12, comment: "Cc Ss Start Year"
    t.string "echeck_bank_name", limit: 128, comment: "Echeck Bank Name"
    t.string "method", limit: 128, comment: "Method"
    t.string "cc_debug_request_body", limit: 32, comment: "Cc Debug Request Body"
    t.string "cc_secure_verify", limit: 32, comment: "Cc Secure Verify"
    t.string "protection_eligibility", limit: 32, comment: "Protection Eligibility"
    t.string "cc_approval", limit: 32, comment: "Cc Approval"
    t.string "cc_last_4", limit: 100, comment: "Cc Last 4"
    t.string "cc_status_description", limit: 32, comment: "Cc Status Description"
    t.string "echeck_type", limit: 32, comment: "Echeck Type"
    t.string "cc_debug_response_serialized", limit: 32, comment: "Cc Debug Response Serialized"
    t.string "cc_ss_start_month", limit: 128, comment: "Cc Ss Start Month"
    t.string "echeck_account_type", comment: "Echeck Account Type"
    t.string "last_trans_id", comment: "Last Trans ID"
    t.string "cc_cid_status", limit: 32, comment: "Cc Cid Status"
    t.string "cc_owner", limit: 128, comment: "Cc Owner"
    t.string "cc_type", limit: 32, comment: "Cc Type"
    t.string "po_number", limit: 32, comment: "Po Number"
    t.string "cc_exp_year", limit: 4, comment: "Cc Exp Year"
    t.string "cc_status", limit: 4, comment: "Cc Status"
    t.string "echeck_routing_number", limit: 32, comment: "Echeck Routing Number"
    t.string "account_status", limit: 32, comment: "Account Status"
    t.string "anet_trans_method", limit: 32, comment: "Anet Trans Method"
    t.string "cc_debug_response_body", limit: 32, comment: "Cc Debug Response Body"
    t.string "cc_ss_issue", limit: 32, comment: "Cc Ss Issue"
    t.string "echeck_account_name", limit: 32, comment: "Echeck Account Name"
    t.string "cc_avs_status", limit: 32, comment: "Cc Avs Status"
    t.string "cc_number_enc", limit: 128
    t.string "cc_trans_id", limit: 32, comment: "Cc Trans ID"
    t.string "address_status", limit: 32, comment: "Address Status"
    t.text "additional_information", comment: "Additional Information"
    t.index ["parent_id"], name: "SALES_ORDER_PAYMENT_PARENT_ID"
  end

  create_table "sales_order_status", primary_key: "status", id: { type: :string, limit: 32, comment: "Status" }, charset: "utf8", comment: "Sales Order Status Table", force: :cascade do |t|
    t.string "label", limit: 128, null: false, comment: "Label"
  end

  create_table "sales_order_status_history", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Order Status History", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "is_customer_notified", comment: "Is Customer Notified"
    t.integer "is_visible_on_front", limit: 2, default: 0, null: false, comment: "Is Visible On Front", unsigned: true
    t.text "comment", comment: "Comment"
    t.string "status", limit: 32, comment: "Status"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.string "entity_name", limit: 32, comment: "Shows what entity history is bind to."
    t.index ["created_at"], name: "SALES_ORDER_STATUS_HISTORY_CREATED_AT"
    t.index ["parent_id"], name: "SALES_ORDER_STATUS_HISTORY_PARENT_ID"
  end

  create_table "sales_order_status_label", primary_key: ["status", "store_id"], charset: "utf8", comment: "Sales Order Status Label Table", force: :cascade do |t|
    t.string "status", limit: 32, null: false, comment: "Status"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "label", limit: 128, null: false, comment: "Label"
    t.index ["store_id"], name: "SALES_ORDER_STATUS_LABEL_STORE_ID"
  end

  create_table "sales_order_status_state", primary_key: ["status", "state"], charset: "utf8", comment: "Sales Order Status Table", force: :cascade do |t|
    t.string "status", limit: 32, null: false, comment: "Status"
    t.string "state", limit: 32, null: false, comment: "Label"
    t.integer "is_default", limit: 2, default: 0, null: false, comment: "Is Default", unsigned: true
    t.integer "visible_on_front", limit: 2, default: 0, null: false, comment: "Visible on front", unsigned: true
  end

  create_table "sales_order_tax", primary_key: "tax_id", id: { type: :integer, comment: "Tax ID", unsigned: true }, charset: "utf8", comment: "Sales Order Tax Table", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.string "code", comment: "Code"
    t.string "title", comment: "Title"
    t.decimal "percent", precision: 12, scale: 4, comment: "Percent"
    t.decimal "amount", precision: 20, scale: 4, comment: "Amount"
    t.integer "priority", null: false, comment: "Priority"
    t.integer "position", null: false, comment: "Position"
    t.decimal "base_amount", precision: 20, scale: 4, comment: "Base Amount"
    t.integer "process", limit: 2, null: false, comment: "Process"
    t.decimal "base_real_amount", precision: 20, scale: 4, comment: "Base Real Amount"
    t.index ["order_id", "priority", "position"], name: "SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION"
  end

  create_table "sales_order_tax_item", primary_key: "tax_item_id", id: { type: :integer, comment: "Tax Item ID", unsigned: true }, charset: "utf8", comment: "Sales Order Tax Item", force: :cascade do |t|
    t.integer "tax_id", null: false, comment: "Tax ID", unsigned: true
    t.integer "item_id", comment: "Item ID", unsigned: true
    t.decimal "tax_percent", precision: 12, scale: 4, null: false, comment: "Real Tax Percent For Item"
    t.decimal "amount", precision: 20, scale: 4, null: false, comment: "Tax amount for the item and tax rate"
    t.decimal "base_amount", precision: 20, scale: 4, null: false, comment: "Base tax amount for the item and tax rate"
    t.decimal "real_amount", precision: 20, scale: 4, null: false, comment: "Real tax amount for the item and tax rate"
    t.decimal "real_base_amount", precision: 20, scale: 4, null: false, comment: "Real base tax amount for the item and tax rate"
    t.integer "associated_item_id", comment: "Id of the associated item", unsigned: true
    t.string "taxable_item_type", limit: 32, null: false, comment: "Type of the taxable item"
    t.index ["associated_item_id"], name: "SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID"
    t.index ["item_id"], name: "SALES_ORDER_TAX_ITEM_ITEM_ID"
    t.index ["tax_id", "item_id"], name: "SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID", unique: true
  end

  create_table "sales_payment_transaction", primary_key: "transaction_id", id: { type: :integer, comment: "Transaction ID", unsigned: true }, charset: "utf8", comment: "Sales Payment Transaction", force: :cascade do |t|
    t.integer "parent_id", comment: "Parent ID", unsigned: true
    t.integer "order_id", default: 0, null: false, comment: "Order ID", unsigned: true
    t.integer "payment_id", default: 0, null: false, comment: "Payment ID", unsigned: true
    t.string "txn_id", limit: 100, comment: "Txn ID"
    t.string "parent_txn_id", limit: 100, comment: "Parent Txn ID"
    t.string "txn_type", limit: 15, comment: "Txn Type"
    t.integer "is_closed", limit: 2, default: 1, null: false, comment: "Is Closed", unsigned: true
    t.binary "additional_information", comment: "Additional Information"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.index ["order_id", "payment_id", "txn_id"], name: "SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID", unique: true
    t.index ["parent_id"], name: "SALES_PAYMENT_TRANSACTION_PARENT_ID"
    t.index ["payment_id"], name: "SALES_PAYMENT_TRANSACTION_PAYMENT_ID"
  end

  create_table "sales_refunded_aggregated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Refunded Aggregated", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "refunded", precision: 20, scale: 4, comment: "Refunded"
    t.decimal "online_refunded", precision: 20, scale: 4, comment: "Online Refunded"
    t.decimal "offline_refunded", precision: 20, scale: 4, comment: "Offline Refunded"
    t.index ["period", "store_id", "order_status"], name: "SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_REFUNDED_AGGREGATED_STORE_ID"
  end

  create_table "sales_refunded_aggregated_order", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Refunded Aggregated Order", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "refunded", precision: 20, scale: 4, comment: "Refunded"
    t.decimal "online_refunded", precision: 20, scale: 4, comment: "Online Refunded"
    t.decimal "offline_refunded", precision: 20, scale: 4, comment: "Offline Refunded"
    t.index ["period", "store_id", "order_status"], name: "SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS", unique: true
    t.index ["store_id"], name: "SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID"
  end

  create_table "sales_sequence_meta", primary_key: "meta_id", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "sales_sequence_meta", force: :cascade do |t|
    t.string "entity_type", limit: 32, null: false, comment: "Prefix"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "sequence_table", limit: 64, null: false, comment: "table for sequence"
    t.index ["entity_type", "store_id"], name: "SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID", unique: true
  end

  create_table "sales_sequence_profile", primary_key: "profile_id", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "sales_sequence_profile", force: :cascade do |t|
    t.integer "meta_id", null: false, comment: "Meta_id", unsigned: true
    t.string "prefix", limit: 32, comment: "Prefix"
    t.string "suffix", limit: 32, comment: "Suffix"
    t.integer "start_value", default: 1, null: false, comment: "Start value for sequence", unsigned: true
    t.integer "step", default: 1, null: false, comment: "Step for sequence", unsigned: true
    t.integer "max_value", null: false, comment: "MaxValue for sequence", unsigned: true
    t.integer "warning_value", null: false, comment: "WarningValue for sequence", unsigned: true
    t.boolean "is_active", default: false, null: false, comment: "isActive flag"
    t.index ["meta_id", "prefix", "suffix"], name: "SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX", unique: true
  end

  create_table "sales_shipment", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Shipment", force: :cascade do |t|
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.decimal "total_weight", precision: 12, scale: 4, comment: "Total Weight"
    t.decimal "total_qty", precision: 12, scale: 4, comment: "Total Qty"
    t.integer "email_sent", limit: 2, comment: "Email Sent", unsigned: true
    t.integer "send_email", limit: 2, comment: "Send Email", unsigned: true
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.integer "customer_id", comment: "Customer ID"
    t.integer "shipping_address_id", comment: "Shipping Address ID"
    t.integer "billing_address_id", comment: "Billing Address ID"
    t.integer "shipment_status", comment: "Shipment Status"
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.text "packages", comment: "Packed Products in Packages"
    t.binary "shipping_label", size: :medium, comment: "Shipping Label Content"
    t.text "customer_note", comment: "Customer Note"
    t.integer "customer_note_notify", limit: 2, comment: "Customer Note Notify", unsigned: true
    t.index ["created_at"], name: "SALES_SHIPMENT_CREATED_AT"
    t.index ["email_sent"], name: "SALES_SHIPMENT_EMAIL_SENT"
    t.index ["increment_id", "store_id"], name: "SALES_SHIPMENT_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_id"], name: "SALES_SHIPMENT_ORDER_ID"
    t.index ["send_email"], name: "SALES_SHIPMENT_SEND_EMAIL"
    t.index ["store_id"], name: "SALES_SHIPMENT_STORE_ID"
    t.index ["total_qty"], name: "SALES_SHIPMENT_TOTAL_QTY"
    t.index ["updated_at"], name: "SALES_SHIPMENT_UPDATED_AT"
  end

  create_table "sales_shipment_comment", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Shipment Comment", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.integer "is_customer_notified", comment: "Is Customer Notified"
    t.integer "is_visible_on_front", limit: 2, default: 0, null: false, comment: "Is Visible On Front", unsigned: true
    t.text "comment", comment: "Comment"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.index ["created_at"], name: "SALES_SHIPMENT_COMMENT_CREATED_AT"
    t.index ["parent_id"], name: "SALES_SHIPMENT_COMMENT_PARENT_ID"
  end

  create_table "sales_shipment_grid", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true, default: nil }, charset: "utf8", comment: "Sales Flat Shipment Grid", force: :cascade do |t|
    t.string "increment_id", limit: 50, comment: "Increment ID"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_increment_id", limit: 32, null: false, comment: "Order Increment ID"
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.timestamp "order_created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Order Increment ID"
    t.string "customer_name", limit: 128, null: false, comment: "Customer Name"
    t.decimal "total_qty", precision: 12, scale: 4, comment: "Total Qty"
    t.integer "shipment_status", comment: "Shipment Status"
    t.string "order_status", limit: 32, comment: "Order"
    t.string "billing_address", comment: "Billing Address"
    t.string "shipping_address", comment: "Shipping Address"
    t.string "billing_name", limit: 128, comment: "Billing Name"
    t.string "shipping_name", limit: 128, comment: "Shipping Name"
    t.string "customer_email", limit: 128, comment: "Customer Email"
    t.integer "customer_group_id"
    t.string "payment_method", limit: 32, comment: "Payment Method"
    t.string "shipping_information", comment: "Shipping Method Name"
    t.timestamp "created_at", comment: "Created At"
    t.timestamp "updated_at", comment: "Updated At"
    t.index ["billing_name"], name: "SALES_SHIPMENT_GRID_BILLING_NAME"
    t.index ["created_at"], name: "SALES_SHIPMENT_GRID_CREATED_AT"
    t.index ["increment_id", "order_increment_id", "shipping_name", "customer_name", "customer_email", "billing_address", "shipping_address"], name: "FTI_086B40C8955F167B8EA76653437879B4", type: :fulltext
    t.index ["increment_id", "store_id"], name: "SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID", unique: true
    t.index ["order_created_at"], name: "SALES_SHIPMENT_GRID_ORDER_CREATED_AT"
    t.index ["order_increment_id"], name: "SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID"
    t.index ["order_status"], name: "SALES_SHIPMENT_GRID_ORDER_STATUS"
    t.index ["shipment_status"], name: "SALES_SHIPMENT_GRID_SHIPMENT_STATUS"
    t.index ["shipping_name"], name: "SALES_SHIPMENT_GRID_SHIPPING_NAME"
    t.index ["store_id"], name: "SALES_SHIPMENT_GRID_STORE_ID"
    t.index ["total_qty"], name: "SALES_SHIPMENT_GRID_TOTAL_QTY"
    t.index ["updated_at"], name: "SALES_SHIPMENT_GRID_UPDATED_AT"
  end

  create_table "sales_shipment_item", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Shipment Item", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.decimal "row_total", precision: 20, scale: 4, comment: "Row Total"
    t.decimal "price", precision: 20, scale: 4, comment: "Price"
    t.decimal "weight", precision: 12, scale: 4, comment: "Weight"
    t.decimal "qty", precision: 12, scale: 4, comment: "Qty"
    t.integer "product_id", comment: "Product ID"
    t.integer "order_item_id", comment: "Order Item ID"
    t.text "additional_data", comment: "Additional Data"
    t.text "description", comment: "Description"
    t.string "name", comment: "Name"
    t.string "sku", comment: "Sku"
    t.index ["parent_id"], name: "SALES_SHIPMENT_ITEM_PARENT_ID"
  end

  create_table "sales_shipment_track", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Sales Flat Shipment Track", force: :cascade do |t|
    t.integer "parent_id", null: false, comment: "Parent ID", unsigned: true
    t.decimal "weight", precision: 12, scale: 4, comment: "Weight"
    t.decimal "qty", precision: 12, scale: 4, comment: "Qty"
    t.integer "order_id", null: false, comment: "Order ID", unsigned: true
    t.text "track_number", comment: "Number"
    t.text "description", comment: "Description"
    t.string "title", comment: "Title"
    t.string "carrier_code", limit: 32, comment: "Carrier Code"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated At"
    t.index ["created_at"], name: "SALES_SHIPMENT_TRACK_CREATED_AT"
    t.index ["order_id"], name: "SALES_SHIPMENT_TRACK_ORDER_ID"
    t.index ["parent_id"], name: "SALES_SHIPMENT_TRACK_PARENT_ID"
  end

  create_table "sales_shipping_aggregated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Shipping Aggregated", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.string "shipping_description", comment: "Shipping Description"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "total_shipping", precision: 20, scale: 4, comment: "Total Shipping"
    t.decimal "total_shipping_actual", precision: 20, scale: 4, comment: "Total Shipping Actual"
    t.index ["period", "store_id", "order_status", "shipping_description"], name: "SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION", unique: true
    t.index ["store_id"], name: "SALES_SHIPPING_AGGREGATED_STORE_ID"
  end

  create_table "sales_shipping_aggregated_order", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Sales Shipping Aggregated Order", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.string "shipping_description", comment: "Shipping Description"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count"
    t.decimal "total_shipping", precision: 20, scale: 4, comment: "Total Shipping"
    t.decimal "total_shipping_actual", precision: 20, scale: 4, comment: "Total Shipping Actual"
    t.index ["period", "store_id", "order_status", "shipping_description"], name: "UNQ_C05FAE47282EEA68654D0924E946761F", unique: true
    t.index ["store_id"], name: "SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID"
  end

  create_table "salesrule", primary_key: "rule_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Salesrule", force: :cascade do |t|
    t.string "name", comment: "Name"
    t.text "description", comment: "Description"
    t.date "from_date", comment: "From"
    t.date "to_date", comment: "To"
    t.integer "uses_per_customer", default: 0, null: false, comment: "Uses Per Customer"
    t.integer "is_active", limit: 2, default: 0, null: false, comment: "Is Active"
    t.text "conditions_serialized", size: :medium, comment: "Conditions Serialized"
    t.text "actions_serialized", size: :medium, comment: "Actions Serialized"
    t.integer "stop_rules_processing", limit: 2, default: 1, null: false, comment: "Stop Rules Processing"
    t.integer "is_advanced", limit: 2, default: 1, null: false, comment: "Is Advanced", unsigned: true
    t.text "product_ids", comment: "Product Ids"
    t.integer "sort_order", default: 0, null: false, comment: "Sort Order", unsigned: true
    t.string "simple_action", limit: 32, comment: "Simple Action"
    t.decimal "discount_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount"
    t.decimal "discount_qty", precision: 12, scale: 4, comment: "Discount Qty"
    t.integer "discount_step", default: 0, null: false, comment: "Discount Step", unsigned: true
    t.integer "apply_to_shipping", limit: 2, default: 0, null: false, comment: "Apply To Shipping", unsigned: true
    t.integer "times_used", default: 0, null: false, comment: "Times Used", unsigned: true
    t.integer "is_rss", limit: 2, default: 0, null: false, comment: "Is Rss"
    t.integer "coupon_type", limit: 2, default: 1, null: false, comment: "Coupon Type", unsigned: true
    t.integer "use_auto_generation", limit: 2, default: 0, null: false, comment: "Use Auto Generation"
    t.integer "uses_per_coupon", default: 0, null: false, comment: "User Per Coupon"
    t.integer "simple_free_shipping", limit: 2, default: 0, null: false, comment: "Simple Free Shipping", unsigned: true
    t.index ["is_active", "sort_order", "to_date", "from_date"], name: "SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE"
  end

  create_table "salesrule_coupon", primary_key: "coupon_id", id: { type: :integer, comment: "Coupon ID", unsigned: true }, charset: "utf8", comment: "Salesrule Coupon", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.string "code", comment: "Code"
    t.integer "usage_limit", comment: "Usage Limit", unsigned: true
    t.integer "usage_per_customer", comment: "Usage Per Customer", unsigned: true
    t.integer "times_used", default: 0, null: false, comment: "Times Used", unsigned: true
    t.datetime "expiration_date", comment: "Expiration Date"
    t.integer "is_primary", limit: 2, comment: "Is Primary", unsigned: true
    t.timestamp "created_at", comment: "Coupon Code Creation Date"
    t.integer "type", limit: 2, default: 0, comment: "Coupon Code Type"
    t.integer "generated_by_dotmailer", limit: 2, comment: "1 = Generated by dotmailer"
    t.index ["code"], name: "SALESRULE_COUPON_CODE", unique: true
    t.index ["rule_id", "is_primary"], name: "SALESRULE_COUPON_RULE_ID_IS_PRIMARY", unique: true
    t.index ["rule_id"], name: "SALESRULE_COUPON_RULE_ID"
  end

  create_table "salesrule_coupon_aggregated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Coupon Aggregated", force: :cascade do |t|
    t.date "period", null: false, comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.string "coupon_code", limit: 50, comment: "Coupon Code"
    t.integer "coupon_uses", default: 0, null: false, comment: "Coupon Uses"
    t.decimal "subtotal_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal Amount"
    t.decimal "discount_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount"
    t.decimal "total_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Amount"
    t.decimal "subtotal_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal Amount Actual"
    t.decimal "discount_amount_actual", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount Actual"
    t.decimal "total_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Amount Actual"
    t.string "rule_name", comment: "Rule Name"
    t.index ["period", "store_id", "order_status", "coupon_code"], name: "SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE", unique: true
    t.index ["rule_name"], name: "SALESRULE_COUPON_AGGREGATED_RULE_NAME"
    t.index ["store_id"], name: "SALESRULE_COUPON_AGGREGATED_STORE_ID"
  end

  create_table "salesrule_coupon_aggregated_order", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Coupon Aggregated Order", force: :cascade do |t|
    t.date "period", null: false, comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.string "coupon_code", limit: 50, comment: "Coupon Code"
    t.integer "coupon_uses", default: 0, null: false, comment: "Coupon Uses"
    t.decimal "subtotal_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal Amount"
    t.decimal "discount_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount"
    t.decimal "total_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Amount"
    t.string "rule_name", comment: "Rule Name"
    t.index ["period", "store_id", "order_status", "coupon_code"], name: "UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B", unique: true
    t.index ["rule_name"], name: "SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME"
    t.index ["store_id"], name: "SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID"
  end

  create_table "salesrule_coupon_aggregated_updated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Salesrule Coupon Aggregated Updated", force: :cascade do |t|
    t.date "period", null: false, comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "order_status", limit: 50, comment: "Order Status"
    t.string "coupon_code", limit: 50, comment: "Coupon Code"
    t.integer "coupon_uses", default: 0, null: false, comment: "Coupon Uses"
    t.decimal "subtotal_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal Amount"
    t.decimal "discount_amount", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount"
    t.decimal "total_amount", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Amount"
    t.decimal "subtotal_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Subtotal Amount Actual"
    t.decimal "discount_amount_actual", precision: 12, scale: 4, default: "0.0", null: false, comment: "Discount Amount Actual"
    t.decimal "total_amount_actual", precision: 20, scale: 4, default: "0.0", null: false, comment: "Total Amount Actual"
    t.string "rule_name", comment: "Rule Name"
    t.index ["period", "store_id", "order_status", "coupon_code"], name: "UNQ_7196FA120A4F0F84E1B66605E87E213E", unique: true
    t.index ["rule_name"], name: "SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME"
    t.index ["store_id"], name: "SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID"
  end

  create_table "salesrule_coupon_usage", primary_key: ["coupon_id", "customer_id"], charset: "utf8", comment: "Salesrule Coupon Usage", force: :cascade do |t|
    t.integer "coupon_id", null: false, comment: "Coupon ID", unsigned: true
    t.integer "customer_id", null: false, comment: "Customer ID", unsigned: true
    t.integer "times_used", default: 0, null: false, comment: "Times Used", unsigned: true
    t.index ["customer_id"], name: "SALESRULE_COUPON_USAGE_CUSTOMER_ID"
  end

  create_table "salesrule_customer", primary_key: "rule_customer_id", id: { type: :integer, comment: "Rule Customer ID", unsigned: true }, charset: "utf8", comment: "Salesrule Customer", force: :cascade do |t|
    t.integer "rule_id", default: 0, null: false, comment: "Rule ID", unsigned: true
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.integer "times_used", limit: 2, default: 0, null: false, comment: "Times Used", unsigned: true
    t.index ["customer_id", "rule_id"], name: "SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID"
    t.index ["rule_id", "customer_id"], name: "SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID"
  end

  create_table "salesrule_customer_group", primary_key: ["rule_id", "customer_group_id"], charset: "utf8", comment: "Sales Rules To Customer Groups Relations", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.index ["customer_group_id"], name: "SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID"
  end

  create_table "salesrule_label", primary_key: "label_id", id: { type: :integer, comment: "Label ID", unsigned: true }, charset: "utf8", comment: "Salesrule Label", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "label", comment: "Label"
    t.index ["rule_id", "store_id"], name: "SALESRULE_LABEL_RULE_ID_STORE_ID", unique: true
    t.index ["store_id"], name: "SALESRULE_LABEL_STORE_ID"
  end

  create_table "salesrule_product_attribute", primary_key: ["rule_id", "website_id", "customer_group_id", "attribute_id"], charset: "utf8", comment: "Salesrule Product Attribute", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.integer "customer_group_id", null: false, comment: "Customer Group ID", unsigned: true
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.index ["attribute_id"], name: "SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID"
    t.index ["customer_group_id"], name: "SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID"
    t.index ["website_id"], name: "SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID"
  end

  create_table "salesrule_website", primary_key: ["rule_id", "website_id"], charset: "utf8", comment: "Sales Rules To Websites Relations", force: :cascade do |t|
    t.integer "rule_id", null: false, comment: "Rule ID", unsigned: true
    t.integer "website_id", limit: 2, null: false, comment: "Website ID", unsigned: true
    t.index ["website_id"], name: "SALESRULE_WEBSITE_WEBSITE_ID"
  end

  create_table "search_query", primary_key: "query_id", id: { type: :integer, comment: "Query ID", unsigned: true }, charset: "utf8", comment: "Search query table", force: :cascade do |t|
    t.string "query_text", comment: "Query text"
    t.integer "num_results", default: 0, null: false, comment: "Num results", unsigned: true
    t.integer "popularity", default: 0, null: false, comment: "Popularity", unsigned: true
    t.string "redirect", comment: "Redirect"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.integer "display_in_terms", limit: 2, default: 1, null: false, comment: "Display in terms"
    t.integer "is_active", limit: 2, default: 1, comment: "Active status"
    t.integer "is_processed", limit: 2, default: 0, comment: "Processed status"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Updated at"
    t.index ["is_processed"], name: "SEARCH_QUERY_IS_PROCESSED"
    t.index ["query_text", "store_id", "popularity"], name: "SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY"
    t.index ["query_text", "store_id"], name: "SEARCH_QUERY_QUERY_TEXT_STORE_ID", unique: true
    t.index ["store_id", "popularity"], name: "SEARCH_QUERY_STORE_ID_POPULARITY"
    t.index ["store_id"], name: "SEARCH_QUERY_STORE_ID"
  end

  create_table "search_synonyms", primary_key: "group_id", id: { type: :bigint, comment: "Synonyms Group ID", unsigned: true }, charset: "utf8", comment: "table storing various synonyms groups", force: :cascade do |t|
    t.text "synonyms", null: false, comment: "list of synonyms making up this group"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID - identifies the store view these synonyms belong to", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID - identifies the website ID these synonyms belong to", unsigned: true
    t.index ["store_id"], name: "SEARCH_SYNONYMS_STORE_ID"
    t.index ["synonyms"], name: "SEARCH_SYNONYMS_SYNONYMS", type: :fulltext
    t.index ["website_id"], name: "SEARCH_SYNONYMS_WEBSITE_ID"
  end

  create_table "sendfriend_log", primary_key: "log_id", id: { type: :integer, comment: "Log ID", unsigned: true }, charset: "utf8", comment: "Send to friend function log storage table", force: :cascade do |t|
    t.bigint "ip", default: 0, null: false, comment: "Customer IP address", unsigned: true
    t.integer "time", default: 0, null: false, comment: "Log time", unsigned: true
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.index ["ip"], name: "SENDFRIEND_LOG_IP"
    t.index ["time"], name: "SENDFRIEND_LOG_TIME"
  end

  create_table "sequence_creditmemo_0", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_creditmemo_1", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_creditmemo_2", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_invoice_0", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_invoice_1", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_invoice_2", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_order_0", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_order_1", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_order_2", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_shipment_0", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_shipment_1", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "sequence_shipment_2", primary_key: "sequence_value", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
  end

  create_table "session", primary_key: "session_id", id: { type: :string, comment: "Session Id" }, charset: "utf8", comment: "Database Sessions Storage", force: :cascade do |t|
    t.integer "session_expires", default: 0, null: false, comment: "Date of Session Expiration", unsigned: true
    t.binary "session_data", size: :medium, null: false, comment: "Session Data"
  end

  create_table "setup_module", primary_key: "module", id: { type: :string, limit: 50, comment: "Module" }, charset: "utf8", comment: "Module versions registry", force: :cascade do |t|
    t.string "schema_version", limit: 50, comment: "Schema Version"
    t.string "data_version", limit: 50, comment: "Data Version"
  end

  create_table "shipping_tablerate", primary_key: "pk", id: { type: :integer, comment: "Primary key", unsigned: true }, charset: "utf8", comment: "Shipping Tablerate", force: :cascade do |t|
    t.integer "website_id", default: 0, null: false, comment: "Website ID"
    t.string "dest_country_id", limit: 4, default: "0", null: false, comment: "Destination coutry ISO/2 or ISO/3 code"
    t.integer "dest_region_id", default: 0, null: false, comment: "Destination Region ID"
    t.string "dest_zip", limit: 10, default: "*", null: false, comment: "Destination Post Code (Zip)"
    t.string "condition_name", limit: 30, null: false, comment: "Rate Condition name"
    t.decimal "condition_value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Rate condition value"
    t.decimal "price", precision: 12, scale: 4, default: "0.0", null: false, comment: "Price"
    t.decimal "cost", precision: 12, scale: 4, default: "0.0", null: false, comment: "Cost"
    t.index ["website_id", "dest_country_id", "dest_region_id", "dest_zip", "condition_name", "condition_value"], name: "UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA", unique: true
  end

  create_table "signifyd_case", primary_key: "entity_id", id: { type: :integer, comment: "Entity_id", unsigned: true }, charset: "utf8", comment: "signifyd_case", force: :cascade do |t|
    t.integer "order_id", comment: "Order_id", unsigned: true
    t.integer "case_id", comment: "Case_id", unsigned: true
    t.boolean "guarantee_eligible", comment: "Guarantee_eligible"
    t.string "guarantee_disposition", limit: 32, default: "PENDING", comment: "Guarantee_disposition"
    t.string "status", limit: 32, default: "PENDING", comment: "Status"
    t.integer "score", comment: "Score", unsigned: true
    t.text "associated_team", comment: "Associated_team"
    t.string "review_disposition", limit: 32, comment: "Review_disposition"
    t.timestamp "created_at", comment: "Created_at"
    t.timestamp "updated_at", comment: "Updated_at"
    t.index ["case_id"], name: "SIGNIFYD_CASE_CASE_ID", unique: true
    t.index ["order_id"], name: "SIGNIFYD_CASE_ORDER_ID", unique: true
  end

  create_table "sitemap", primary_key: "sitemap_id", id: { type: :integer, comment: "Sitemap ID", unsigned: true }, charset: "utf8", comment: "XML Sitemap", force: :cascade do |t|
    t.string "sitemap_type", limit: 32, comment: "Sitemap Type"
    t.string "sitemap_filename", limit: 32, comment: "Sitemap Filename"
    t.string "sitemap_path", comment: "Sitemap Path"
    t.timestamp "sitemap_time", comment: "Sitemap Time"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.index ["store_id"], name: "SITEMAP_STORE_ID"
  end

  create_table "store", primary_key: "store_id", id: { type: :integer, limit: 2, comment: "Store ID", unsigned: true }, charset: "utf8", comment: "Stores", force: :cascade do |t|
    t.string "code", limit: 32, comment: "Code"
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.integer "group_id", limit: 2, default: 0, null: false, comment: "Group ID", unsigned: true
    t.string "name", null: false, comment: "Store Name"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Store Sort Order", unsigned: true
    t.integer "is_active", limit: 2, default: 0, null: false, comment: "Store Activity", unsigned: true
    t.index ["code"], name: "STORE_CODE", unique: true
    t.index ["group_id"], name: "STORE_GROUP_ID"
    t.index ["is_active", "sort_order"], name: "STORE_IS_ACTIVE_SORT_ORDER"
    t.index ["website_id"], name: "STORE_WEBSITE_ID"
  end

  create_table "store_group", primary_key: "group_id", id: { type: :integer, limit: 2, comment: "Group ID", unsigned: true }, charset: "utf8", comment: "Store Groups", force: :cascade do |t|
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.string "name", null: false, comment: "Store Group Name"
    t.integer "root_category_id", default: 0, null: false, comment: "Root Category ID", unsigned: true
    t.integer "default_store_id", limit: 2, default: 0, null: false, comment: "Default Store ID", unsigned: true
    t.string "code", limit: 32, comment: "Store group unique code"
    t.index ["code"], name: "STORE_GROUP_CODE", unique: true
    t.index ["default_store_id"], name: "STORE_GROUP_DEFAULT_STORE_ID"
    t.index ["website_id"], name: "STORE_GROUP_WEBSITE_ID"
  end

  create_table "store_website", primary_key: "website_id", id: { type: :integer, limit: 2, comment: "Website ID", unsigned: true }, charset: "utf8", comment: "Websites", force: :cascade do |t|
    t.string "code", limit: 32, comment: "Code"
    t.string "name", limit: 64, comment: "Website Name"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order", unsigned: true
    t.integer "default_group_id", limit: 2, default: 0, null: false, comment: "Default Group ID", unsigned: true
    t.integer "is_default", limit: 2, default: 0, comment: "Defines Is Website Default", unsigned: true
    t.index ["code"], name: "STORE_WEBSITE_CODE", unique: true
    t.index ["default_group_id"], name: "STORE_WEBSITE_DEFAULT_GROUP_ID"
    t.index ["sort_order"], name: "STORE_WEBSITE_SORT_ORDER"
  end

  create_table "tax_calculation", primary_key: "tax_calculation_id", id: { type: :integer, comment: "Tax Calculation ID" }, charset: "utf8", comment: "Tax Calculation", force: :cascade do |t|
    t.integer "tax_calculation_rate_id", null: false, comment: "Tax Calculation Rate ID"
    t.integer "tax_calculation_rule_id", null: false, comment: "Tax Calculation Rule ID"
    t.integer "customer_tax_class_id", limit: 2, null: false, comment: "Customer Tax Class ID"
    t.integer "product_tax_class_id", limit: 2, null: false, comment: "Product Tax Class ID"
    t.index ["customer_tax_class_id"], name: "TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID"
    t.index ["product_tax_class_id"], name: "TAX_CALCULATION_PRODUCT_TAX_CLASS_ID"
    t.index ["tax_calculation_rate_id", "customer_tax_class_id", "product_tax_class_id"], name: "TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID"
    t.index ["tax_calculation_rule_id"], name: "TAX_CALCULATION_TAX_CALCULATION_RULE_ID"
  end

  create_table "tax_calculation_rate", primary_key: "tax_calculation_rate_id", id: { type: :integer, comment: "Tax Calculation Rate ID" }, charset: "utf8", comment: "Tax Calculation Rate", force: :cascade do |t|
    t.string "tax_country_id", limit: 2, null: false, comment: "Tax Country ID"
    t.integer "tax_region_id", null: false, comment: "Tax Region ID"
    t.string "tax_postcode", limit: 21, comment: "Tax Postcode"
    t.string "code", null: false, comment: "Code"
    t.decimal "rate", precision: 12, scale: 4, null: false, comment: "Rate"
    t.integer "zip_is_range", limit: 2, comment: "Zip Is Range"
    t.integer "zip_from", comment: "Zip From", unsigned: true
    t.integer "zip_to", comment: "Zip To", unsigned: true
    t.index ["code"], name: "TAX_CALCULATION_RATE_CODE"
    t.index ["tax_calculation_rate_id", "tax_country_id", "tax_region_id", "zip_is_range", "tax_postcode"], name: "IDX_CA799F1E2CB843495F601E56C84A626D"
    t.index ["tax_country_id", "tax_region_id", "tax_postcode"], name: "TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE"
  end

  create_table "tax_calculation_rate_title", primary_key: "tax_calculation_rate_title_id", id: { type: :integer, comment: "Tax Calculation Rate Title ID" }, charset: "utf8", comment: "Tax Calculation Rate Title", force: :cascade do |t|
    t.integer "tax_calculation_rate_id", null: false, comment: "Tax Calculation Rate ID"
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "value", null: false, comment: "Value"
    t.index ["store_id"], name: "TAX_CALCULATION_RATE_TITLE_STORE_ID"
    t.index ["tax_calculation_rate_id", "store_id"], name: "TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID"
  end

  create_table "tax_calculation_rule", primary_key: "tax_calculation_rule_id", id: { type: :integer, comment: "Tax Calculation Rule ID" }, charset: "utf8", comment: "Tax Calculation Rule", force: :cascade do |t|
    t.string "code", null: false, comment: "Code"
    t.integer "priority", null: false, comment: "Priority"
    t.integer "position", null: false, comment: "Position"
    t.integer "calculate_subtotal", null: false, comment: "Calculate off subtotal option"
    t.index ["code"], name: "TAX_CALCULATION_RULE_CODE"
    t.index ["priority", "position"], name: "TAX_CALCULATION_RULE_PRIORITY_POSITION"
  end

  create_table "tax_class", primary_key: "class_id", id: { type: :integer, limit: 2, comment: "Class ID" }, charset: "utf8", comment: "Tax Class", force: :cascade do |t|
    t.string "class_name", null: false, comment: "Class Name"
    t.string "class_type", limit: 8, default: "CUSTOMER", null: false, comment: "Class Type"
  end

  create_table "tax_order_aggregated_created", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Tax Order Aggregation", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "code", null: false, comment: "Code"
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.float "percent", comment: "Percent"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count", unsigned: true
    t.float "tax_base_amount_sum", comment: "Tax Base Amount Sum"
    t.index ["period", "store_id", "code", "percent", "order_status"], name: "TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS", unique: true
    t.index ["store_id"], name: "TAX_ORDER_AGGREGATED_CREATED_STORE_ID"
  end

  create_table "tax_order_aggregated_updated", id: { type: :integer, comment: "ID", unsigned: true }, charset: "utf8", comment: "Tax Order Aggregated Updated", force: :cascade do |t|
    t.date "period", comment: "Period"
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.string "code", null: false, comment: "Code"
    t.string "order_status", limit: 50, null: false, comment: "Order Status"
    t.float "percent", comment: "Percent"
    t.integer "orders_count", default: 0, null: false, comment: "Orders Count", unsigned: true
    t.float "tax_base_amount_sum", comment: "Tax Base Amount Sum"
    t.index ["period", "store_id", "code", "percent", "order_status"], name: "TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS", unique: true
    t.index ["store_id"], name: "TAX_ORDER_AGGREGATED_UPDATED_STORE_ID"
  end

  create_table "temando_product_attribute_mapping", primary_key: "node_path_id", id: { type: :string, comment: "Magento shipping path" }, charset: "utf8", comment: "Product Attribute Mapping Entity", force: :cascade do |t|
    t.string "label", null: false, comment: "label to be displayed to the end user"
    t.text "description", comment: "Describes what the label and path are for"
    t.string "mapping_attribute_id", comment: "Attribute ID reference that is mapped to the node path"
    t.boolean "is_default", null: false, comment: "Determines if the attribute is available by default"
  end

  create_table "theme", primary_key: "theme_id", id: { type: :integer, comment: "Theme identifier", unsigned: true }, charset: "utf8", comment: "Core theme", force: :cascade do |t|
    t.integer "parent_id", comment: "Parent ID"
    t.string "theme_path", comment: "Theme Path"
    t.string "theme_title", null: false, comment: "Theme Title"
    t.string "preview_image", comment: "Preview Image"
    t.boolean "is_featured", default: false, null: false, comment: "Is Theme Featured"
    t.string "area", null: false, comment: "Theme Area"
    t.integer "type", limit: 2, null: false, comment: "Theme type: 0:physical, 1:virtual, 2:staging"
    t.text "code", comment: "Full theme code, including package"
  end

  create_table "theme_file", primary_key: "theme_files_id", id: { type: :integer, comment: "Theme files identifier", unsigned: true }, charset: "utf8", comment: "Core theme files", force: :cascade do |t|
    t.integer "theme_id", null: false, comment: "Theme ID", unsigned: true
    t.string "file_path", comment: "Relative path to file"
    t.string "file_type", limit: 32, null: false, comment: "File Type"
    t.text "content", size: :long, null: false, comment: "File Content"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort Order"
    t.boolean "is_temporary", default: false, null: false, comment: "Is Temporary File"
    t.index ["theme_id"], name: "THEME_FILE_THEME_ID_THEME_THEME_ID"
  end

  create_table "translation", primary_key: "key_id", id: { type: :integer, comment: "Key ID of Translation", unsigned: true }, charset: "utf8", comment: "Translations", force: :cascade do |t|
    t.string "string", default: "Translate String", null: false, comment: "Translation String"
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.string "translate", comment: "Translate"
    t.string "locale", limit: 20, default: "en_US", null: false, comment: "Locale"
    t.bigint "crc_string", default: 1591228201, null: false, comment: "Translation String CRC32 Hash"
    t.index ["store_id", "locale", "crc_string", "string"], name: "TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING", unique: true
  end

  create_table "ui_bookmark", primary_key: "bookmark_id", id: { type: :integer, comment: "Bookmark identifier", unsigned: true }, charset: "utf8", comment: "Bookmark", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "User ID", unsigned: true
    t.string "namespace", null: false, comment: "Bookmark namespace"
    t.string "identifier", null: false, comment: "Bookmark Identifier"
    t.integer "current", limit: 2, null: false, comment: "Mark current bookmark per user and identifier"
    t.string "title", comment: "Bookmark title"
    t.text "config", size: :long, comment: "Bookmark config"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Bookmark created at"
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Bookmark updated at"
    t.index ["user_id", "namespace", "identifier"], name: "UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER"
  end

  create_table "url_rewrite", primary_key: "url_rewrite_id", id: { type: :integer, comment: "Rewrite ID", unsigned: true }, charset: "utf8", comment: "Url Rewrites", force: :cascade do |t|
    t.string "entity_type", limit: 32, null: false, comment: "Entity type code"
    t.integer "entity_id", null: false, comment: "Entity ID", unsigned: true
    t.string "request_path", comment: "Request Path"
    t.string "target_path", comment: "Target Path"
    t.integer "redirect_type", limit: 2, default: 0, null: false, comment: "Redirect Type", unsigned: true
    t.integer "store_id", limit: 2, null: false, comment: "Store ID", unsigned: true
    t.string "description", comment: "Description"
    t.integer "is_autogenerated", limit: 2, default: 0, null: false, comment: "Is rewrite generated automatically flag", unsigned: true
    t.string "metadata", comment: "Meta data for url rewrite"
    t.index ["entity_id"], name: "URL_REWRITE_ENTITY_ID"
    t.index ["request_path", "store_id"], name: "URL_REWRITE_REQUEST_PATH_STORE_ID", unique: true
    t.index ["store_id", "entity_id"], name: "URL_REWRITE_STORE_ID_ENTITY_ID"
    t.index ["target_path"], name: "URL_REWRITE_TARGET_PATH"
  end

  create_table "user_views", charset: "latin1", force: :cascade do |t|
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.bigint "account_id", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type", "resource_id"], name: "index_user_views_on_resource_type_and_resource_id"
  end

  create_table "variable", primary_key: "variable_id", id: { type: :integer, comment: "Variable ID", unsigned: true }, charset: "utf8", comment: "Variables", force: :cascade do |t|
    t.string "code", comment: "Variable Code"
    t.string "name", comment: "Variable Name"
    t.index ["code"], name: "VARIABLE_CODE", unique: true
  end

  create_table "variable_value", primary_key: "value_id", id: { type: :integer, comment: "Variable Value ID", unsigned: true }, charset: "utf8", comment: "Variable Value", force: :cascade do |t|
    t.integer "variable_id", default: 0, null: false, comment: "Variable ID", unsigned: true
    t.integer "store_id", limit: 2, default: 0, null: false, comment: "Store ID", unsigned: true
    t.text "plain_value", comment: "Plain Text Value"
    t.text "html_value", comment: "Html Value"
    t.index ["store_id"], name: "VARIABLE_VALUE_STORE_ID"
    t.index ["variable_id", "store_id"], name: "VARIABLE_VALUE_VARIABLE_ID_STORE_ID", unique: true
  end

  create_table "vault_payment_token", primary_key: "entity_id", id: { type: :integer, comment: "Entity ID", unsigned: true }, charset: "utf8", comment: "Vault tokens of payment", force: :cascade do |t|
    t.integer "customer_id", comment: "Customer ID", unsigned: true
    t.string "public_hash", limit: 128, null: false, comment: "Hash code for using on frontend"
    t.string "payment_method_code", limit: 128, null: false, comment: "Payment method code"
    t.string "type", limit: 128, null: false, comment: "Type"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Created At"
    t.timestamp "expires_at", comment: "Expires At"
    t.string "gateway_token", null: false, comment: "Gateway Token"
    t.text "details", comment: "Details"
    t.boolean "is_active", default: true, null: false
    t.boolean "is_visible", default: true, null: false
    t.index ["customer_id"], name: "VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID"
    t.index ["payment_method_code", "customer_id", "gateway_token"], name: "VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN", unique: true
    t.index ["public_hash"], name: "VAULT_PAYMENT_TOKEN_PUBLIC_HASH", unique: true
  end

  create_table "vault_payment_token_order_payment_link", primary_key: ["order_payment_id", "payment_token_id"], charset: "utf8", comment: "Order payments to vault token", force: :cascade do |t|
    t.integer "order_payment_id", null: false, comment: "Order payment ID", unsigned: true
    t.integer "payment_token_id", null: false, comment: "Payment token ID", unsigned: true
    t.index ["payment_token_id"], name: "FK_4ED894655446D385894580BECA993862"
  end

  create_table "vertex_custom_option_flex_field", primary_key: "entity_id", id: { type: :integer, comment: "Map Entity ID" }, charset: "utf8", comment: "Customizable Option to Flex Field Map", force: :cascade do |t|
    t.integer "option_id", null: false, comment: "Customizable Option ID"
    t.integer "website_id", default: 0, null: false, comment: "Website ID"
    t.integer "flex_field", default: 0, comment: "Customizable Option to Flex Field Map"
    t.index ["option_id", "website_id"], name: "VERTEX_CUSTOM_OPTION_FLEX_FIELD_OPTION_ID_WEBSITE_ID", unique: true
    t.index ["option_id"], name: "VERTEX_CUSTOM_OPTION_FLEX_FIELD_OPTION_ID"
    t.index ["website_id"], name: "VERTEX_CUSTOM_OPTION_FLEX_FIELD_WEBSITE_ID"
  end

  create_table "vertex_customer_code", primary_key: "customer_id", id: { type: :integer, comment: "Customer ID", unsigned: true, default: nil }, charset: "utf8", comment: "Customer Code for Vertex", force: :cascade do |t|
    t.text "customer_code", comment: "Customer Code for Vertex"
  end

  create_table "vertex_customer_country", primary_key: "customer_id", id: { type: :integer, comment: "Customer ID", unsigned: true, default: nil }, charset: "utf8", comment: "Country associated to Customer", force: :cascade do |t|
    t.string "customer_country", comment: "Customer Country"
  end

  create_table "vertex_invoice_sent", primary_key: "invoice_id", id: { type: :integer, comment: "Invoice ID", unsigned: true, default: nil }, charset: "utf8", force: :cascade do |t|
    t.boolean "sent_to_vertex", default: false, null: false, comment: "Invoice has been logged in Vertex"
  end

  create_table "vertex_order_invoice_status", primary_key: "order_id", id: { type: :integer, comment: "Order ID", unsigned: true, default: nil }, charset: "utf8", comment: "Invoice has been logged in Vertex", force: :cascade do |t|
    t.boolean "sent_to_vertex", default: false, null: false, comment: "Invoice has been logged in Vertex"
  end

  create_table "vertex_sales_creditmemo_item_invoice_text_code", id: false, charset: "utf8", comment: "Creditmemo text code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Creditmemo Item ID"
    t.string "invoice_text_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["invoice_text_code"], name: "VERTEX_SALES_CREDITMEMO_ITEM_INVOICE_TEXT_CODE_INVOICE_TEXT_CODE"
    t.index ["item_id", "invoice_text_code"], name: "UNQ_4BC40DA748D7713ADA661D2DE1BCF161", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_CREDITMEMO_ITEM_INVOICE_TEXT_CODE_ITEM_ID"
  end

  create_table "vertex_sales_creditmemo_item_tax_code", id: false, charset: "utf8", comment: "Creditmemo tax code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Creditmemo Item ID"
    t.string "tax_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["item_id", "tax_code"], name: "VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_ITEM_ID_TAX_CODE", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_ITEM_ID"
    t.index ["tax_code"], name: "VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_TAX_CODE"
  end

  create_table "vertex_sales_creditmemo_item_vertex_tax_code", id: false, charset: "utf8", comment: "Creditmemo vertex tax code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Creditmemo Item ID"
    t.string "vertex_tax_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["item_id", "vertex_tax_code"], name: "UNQ_31D7AADB3412BC7E7C1C98D5CC3A5D46", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_CREDITMEMO_ITEM_VERTEX_TAX_CODE_ITEM_ID"
    t.index ["vertex_tax_code"], name: "VERTEX_SALES_CREDITMEMO_ITEM_VERTEX_TAX_CODE_VERTEX_TAX_CODE"
  end

  create_table "vertex_sales_order_item_invoice_text_code", id: false, charset: "utf8", comment: "Invoice text code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Order ID", unsigned: true
    t.string "invoice_text_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["invoice_text_code"], name: "VERTEX_SALES_ORDER_ITEM_INVOICE_TEXT_CODE_INVOICE_TEXT_CODE"
    t.index ["item_id", "invoice_text_code"], name: "UNQ_96F6BE3160A4185CEA4D866018EAF6DC", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_ORDER_ITEM_INVOICE_TEXT_CODE_ITEM_ID"
  end

  create_table "vertex_sales_order_item_tax_code", id: false, charset: "utf8", comment: "Invoice tax code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Creditmemo Item ID"
    t.string "tax_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["item_id", "tax_code"], name: "VERTEX_SALES_ORDER_ITEM_TAX_CODE_ITEM_ID_TAX_CODE", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_ORDER_ITEM_TAX_CODE_ITEM_ID"
    t.index ["tax_code"], name: "VERTEX_SALES_ORDER_ITEM_TAX_CODE_TAX_CODE"
  end

  create_table "vertex_sales_order_item_vertex_tax_code", id: false, charset: "utf8", comment: "Invoice Vertex tax code from Vertex", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "Creditmemo Item ID"
    t.string "vertex_tax_code", limit: 100, null: false, comment: "Invoice text code from Vertex"
    t.index ["item_id", "vertex_tax_code"], name: "VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_ITEM_ID_VERTEX_TAX_CODE", unique: true
    t.index ["item_id"], name: "VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_ITEM_ID"
    t.index ["vertex_tax_code"], name: "VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_VERTEX_TAX_CODE"
  end

  create_table "vertex_taxrequest", primary_key: "request_id", id: { comment: "Request Id" }, charset: "utf8", comment: "The tax request table", force: :cascade do |t|
    t.string "request_type", null: false, comment: "Request type"
    t.integer "response_time", null: false, comment: "Milliseconds taken for Vertex API call to complete", unsigned: true
    t.bigint "quote_id", null: false, comment: "Quote Id"
    t.bigint "order_id", null: false, comment: "Order Id"
    t.string "total_tax", null: false, comment: "Total Tax Amount"
    t.string "source_path", null: false, comment: "Source path controller_module_action"
    t.string "tax_area_id", null: false, comment: "Tax Jurisdictions Id"
    t.string "sub_total", null: false, comment: "Response Subtotal Amount"
    t.string "total", null: false, comment: "Response Total Amount"
    t.string "lookup_result", null: false, comment: "Tax Area Response Lookup Result"
    t.timestamp "request_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Request create date"
    t.text "request_xml", null: false, comment: "Request XML"
    t.text "response_xml", null: false, comment: "Response XML"
    t.index ["order_id"], name: "VERTEX_TAXREQUEST_ORDER_ID"
    t.index ["request_id"], name: "VERTEX_TAXREQUEST_REQUEST_ID", unique: true
    t.index ["request_type"], name: "VERTEX_TAXREQUEST_REQUEST_TYPE"
  end

  create_table "vertex_vat_country_code", primary_key: "address_id", id: { type: :integer, comment: "Address ID", unsigned: true, default: nil }, charset: "utf8", comment: "Vat Country code associated to Order Address", force: :cascade do |t|
    t.string "customer_country", comment: "Customer Country"
  end

  create_table "weee_tax", primary_key: "value_id", id: { type: :integer, comment: "Value ID" }, charset: "utf8", comment: "Weee Tax", force: :cascade do |t|
    t.integer "website_id", limit: 2, default: 0, null: false, comment: "Website ID", unsigned: true
    t.integer "entity_id", default: 0, null: false, comment: "Entity ID", unsigned: true
    t.string "country", limit: 2, comment: "Country"
    t.decimal "value", precision: 12, scale: 4, default: "0.0", null: false, comment: "Value"
    t.integer "state", default: 0, null: false, comment: "State"
    t.integer "attribute_id", limit: 2, null: false, comment: "Attribute ID", unsigned: true
    t.index ["attribute_id"], name: "WEEE_TAX_ATTRIBUTE_ID"
    t.index ["country"], name: "WEEE_TAX_COUNTRY"
    t.index ["entity_id"], name: "WEEE_TAX_ENTITY_ID"
    t.index ["website_id"], name: "WEEE_TAX_WEBSITE_ID"
  end

  create_table "widget", primary_key: "widget_id", id: { type: :integer, comment: "Widget ID", unsigned: true }, charset: "utf8", comment: "Preconfigured Widgets", force: :cascade do |t|
    t.string "widget_code", comment: "Widget code for template directive"
    t.string "widget_type", comment: "Widget Type"
    t.text "parameters", comment: "Parameters"
    t.index ["widget_code"], name: "WIDGET_WIDGET_CODE"
  end

  create_table "widget_instance", primary_key: "instance_id", id: { type: :integer, comment: "Instance ID", unsigned: true }, charset: "utf8", comment: "Instances of Widget for Package Theme", force: :cascade do |t|
    t.string "instance_type", comment: "Instance Type"
    t.integer "theme_id", null: false, comment: "Theme ID", unsigned: true
    t.string "title", comment: "Widget Title"
    t.string "store_ids", default: "0", null: false, comment: "Store ids"
    t.text "widget_parameters", comment: "Widget parameters"
    t.integer "sort_order", limit: 2, default: 0, null: false, comment: "Sort order", unsigned: true
    t.index ["theme_id"], name: "WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID"
  end

  create_table "widget_instance_page", primary_key: "page_id", id: { type: :integer, comment: "Page ID", unsigned: true }, charset: "utf8", comment: "Instance of Widget on Page", force: :cascade do |t|
    t.integer "instance_id", default: 0, null: false, comment: "Instance ID", unsigned: true
    t.string "page_group", limit: 25, comment: "Block Group Type"
    t.string "layout_handle", comment: "Layout Handle"
    t.string "block_reference", comment: "Container"
    t.string "page_for", limit: 25, comment: "For instance entities"
    t.text "entities", comment: "Catalog entities (comma separated)"
    t.string "page_template", comment: "Path to widget template"
    t.index ["instance_id"], name: "WIDGET_INSTANCE_PAGE_INSTANCE_ID"
  end

  create_table "widget_instance_page_layout", id: false, charset: "utf8", comment: "Layout updates", force: :cascade do |t|
    t.integer "page_id", default: 0, null: false, comment: "Page ID", unsigned: true
    t.integer "layout_update_id", default: 0, null: false, comment: "Layout Update ID", unsigned: true
    t.index ["layout_update_id", "page_id"], name: "WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID", unique: true
    t.index ["page_id"], name: "WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID"
  end

  create_table "wishlist", primary_key: "wishlist_id", id: { type: :integer, comment: "Wishlist ID", unsigned: true }, charset: "utf8", comment: "Wishlist main Table", force: :cascade do |t|
    t.integer "customer_id", default: 0, null: false, comment: "Customer ID", unsigned: true
    t.integer "shared", limit: 2, default: 0, null: false, comment: "Sharing flag (0 or 1)", unsigned: true
    t.string "sharing_code", limit: 32, comment: "Sharing encrypted code"
    t.timestamp "updated_at", comment: "Last updated date"
    t.index ["customer_id"], name: "WISHLIST_CUSTOMER_ID", unique: true
    t.index ["shared"], name: "WISHLIST_SHARED"
  end

  create_table "wishlist_item", primary_key: "wishlist_item_id", id: { type: :integer, comment: "Wishlist item ID", unsigned: true }, charset: "utf8", comment: "Wishlist items", force: :cascade do |t|
    t.integer "wishlist_id", default: 0, null: false, comment: "Wishlist ID", unsigned: true
    t.integer "product_id", default: 0, null: false, comment: "Product ID", unsigned: true
    t.integer "store_id", limit: 2, comment: "Store ID", unsigned: true
    t.timestamp "added_at", comment: "Add date and time"
    t.text "description", comment: "Short description of wish list item"
    t.decimal "qty", precision: 12, scale: 4, null: false, comment: "Qty"
    t.index ["product_id"], name: "WISHLIST_ITEM_PRODUCT_ID"
    t.index ["store_id"], name: "WISHLIST_ITEM_STORE_ID"
    t.index ["wishlist_id"], name: "WISHLIST_ITEM_WISHLIST_ID"
  end

  create_table "wishlist_item_option", primary_key: "option_id", id: { type: :integer, comment: "Option ID", unsigned: true }, charset: "utf8", comment: "Wishlist Item Option Table", force: :cascade do |t|
    t.integer "wishlist_item_id", null: false, comment: "Wishlist Item ID", unsigned: true
    t.integer "product_id", null: false, comment: "Product ID", unsigned: true
    t.string "code", null: false, comment: "Code"
    t.text "value", comment: "Value"
    t.index ["wishlist_item_id"], name: "FK_A014B30B04B72DD0EAB3EECD779728D6"
  end

  create_table "wk_mp_wysiwyg_image", primary_key: "entity_id", id: { type: :integer, comment: "Entity Id", unsigned: true }, charset: "utf8", comment: "Decription Image", force: :cascade do |t|
    t.integer "seller_id", default: 0, null: false, comment: "Seller Id", unsigned: true
    t.text "url", comment: "Image Url"
    t.text "name", comment: "Name"
    t.text "type", comment: "Type"
    t.text "file", comment: "File"
  end

  create_table "yotpo_rich_snippets", primary_key: "rich_snippet_id", id: { type: :integer, comment: "Id" }, charset: "utf8", comment: "yotpo_rich_snippets", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "Product Id"
    t.integer "store_id", null: false, comment: "Store Id"
    t.decimal "average_score", precision: 10, scale: 2, comment: "Average Score"
    t.float "reviews_count", null: false, comment: "Reviews Count"
    t.timestamp "expiration_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Expiry Time"
  end

  create_table "yotpo_sync", primary_key: "sync_id", id: { type: :integer, comment: "Id", unsigned: true }, charset: "utf8", comment: "yotpo_sync", force: :cascade do |t|
    t.integer "store_id", comment: "Store ID", unsigned: true
    t.string "entity_type", limit: 50, comment: "Entity Type"
    t.integer "entity_id", comment: "Entity ID", unsigned: true
    t.integer "sync_flag", limit: 2, default: 0, comment: "Sync Flag"
    t.datetime "sync_date", null: false, comment: "Sync Date"
    t.index ["store_id", "entity_type", "entity_id"], name: "YOTPO_SYNC_STORE_ID_ENTITY_TYPE_ENTITY_ID", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_passwords", "admin_user", column: "user_id", primary_key: "user_id", name: "ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "admin_user_expiration", "admin_user", column: "user_id", primary_key: "user_id", name: "ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "admin_user_session", "admin_user", column: "user_id", primary_key: "user_id", name: "ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "adobe_stock_asset", "adobe_stock_category", column: "category_id", name: "ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID", on_delete: :nullify
  add_foreign_key "adobe_stock_asset", "adobe_stock_creator", column: "creator_id", name: "ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID", on_delete: :nullify
  add_foreign_key "adobe_stock_asset", "media_gallery_asset", column: "media_gallery_id", name: "ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID", on_delete: :cascade
  add_foreign_key "adobe_user_profile", "admin_user", primary_key: "user_id", name: "ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_additional_fee", "quote", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_ADDITIONAL_FEE_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :nullify
  add_foreign_key "amasty_amcheckout_additional_fee", "sales_order", column: "order_id", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_ADDITIONAL_FEE_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_delivery", "quote", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_DELIVERY_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :nullify
  add_foreign_key "amasty_amcheckout_delivery", "sales_order", column: "order_id", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_DELIVERY_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_field", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "AMASTY_AMCHECKOUT_FIELD_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_order_custom_fields", "sales_order", column: "order_id", primary_key: "entity_id", name: "AMASTY_AMCHKT_ORDER_CUSTOM_FIELDS_ORDER_ID_SALES_ORDER_ENTT_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_quote_custom_fields", "quote", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_QUOTE_CUSTOM_FIELDS_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amasty_amcheckout_quote_passwords", "quote", primary_key: "entity_id", name: "AMASTY_AMCHECKOUT_QUOTE_PASSWORDS_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amasty_amshopby_cms_page", "cms_page", column: "page_id", primary_key: "page_id", name: "AMASTY_AMSHOPBY_CMS_PAGE_PAGE_ID_CMS_PAGE_PAGE_ID", on_delete: :cascade
  add_foreign_key "amasty_amshopby_group_attr", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "AMASTY_AMSHOPBY_GROUP_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "amasty_amshopby_group_attr_option", "amasty_amshopby_group_attr", column: "group_id", primary_key: "group_id", name: "FK_512FE499D9317E6CF87BCA96000CE351", on_delete: :cascade
  add_foreign_key "amasty_amshopby_group_attr_option", "eav_attribute_option", column: "option_id", primary_key: "option_id", name: "AMASTY_AMSHOPBY_GROUP_ATTR_OPT_OPT_ID_EAV_ATTR_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "amasty_amshopby_group_attr_value", "amasty_amshopby_group_attr", column: "group_id", primary_key: "group_id", name: "FK_48904B8AA7D37656849240EB1C2061BB", on_delete: :cascade
  add_foreign_key "amasty_amshopby_page", "cms_block", column: "bottom_block_id", primary_key: "block_id", name: "AMASTY_AMSHOPBY_PAGE_BOTTOM_BLOCK_ID_CMS_BLOCK_BLOCK_ID", on_delete: :nullify
  add_foreign_key "amasty_amshopby_page", "cms_block", column: "top_block_id", primary_key: "block_id", name: "AMASTY_AMSHOPBY_PAGE_TOP_BLOCK_ID_CMS_BLOCK_BLOCK_ID", on_delete: :nullify
  add_foreign_key "amasty_amshopby_page_store", "amasty_amshopby_page", column: "page_id", primary_key: "page_id", name: "AMASTY_AMSHOPBY_PAGE_STORE_PAGE_ID_AMASTY_AMSHOPBY_PAGE_PAGE_ID", on_delete: :cascade
  add_foreign_key "amasty_amshopby_page_store", "store", primary_key: "store_id", name: "AMASTY_AMSHOPBY_PAGE_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_item_condition_store", "amasty_rma_item_condition", column: "condition_id", primary_key: "condition_id", name: "FK_2AE51875AF0CD885E7FF189617DF0590", on_delete: :cascade
  add_foreign_key "amasty_rma_message_file", "amasty_rma_message", column: "message_id", primary_key: "message_id", name: "AMASTY_RMA_MESSAGE_FILE_MESSAGE_ID_AMASTY_RMA_MESSAGE_MESSAGE_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_reason_store", "amasty_rma_reason", column: "reason_id", primary_key: "reason_id", name: "AMASTY_RMA_REASON_STORE_REASON_ID_AMASTY_RMA_REASON_REASON_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_request_item", "amasty_rma_request", column: "request_id", primary_key: "request_id", name: "AMASTY_RMA_REQUEST_ITEM_REQUEST_ID_AMASTY_RMA_REQUEST_REQUEST_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_resolution_store", "amasty_rma_resolution", column: "resolution_id", primary_key: "resolution_id", name: "FK_C21BC2C5A88ED9E15961FB0B07D80048", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_customer_groups", "amasty_rma_return_rules", column: "rule_id", name: "FK_5B74433CD256510C87EAC89DE35FC059", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_customer_groups", "customer_group", primary_key: "customer_group_id", name: "FK_6EEEF04D9F995F32BE4A474E341A55A6", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_resolutions", "amasty_rma_resolution", column: "resolution_id", primary_key: "resolution_id", name: "FK_F1EB7F075D2D853BC64A269BAF937D7E", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_resolutions", "amasty_rma_return_rules", column: "rule_id", name: "FK_47F426414767D2E1306A79850D3A44EE", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_websites", "amasty_rma_return_rules", column: "rule_id", name: "AMASTY_RMA_RETURN_RULES_WSS_RULE_ID_AMASTY_RMA_RETURN_RULES_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_return_rules_websites", "store_website", column: "website_id", primary_key: "website_id", name: "AMASTY_RMA_RETURN_RULES_WSS_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "amasty_rma_status_store", "amasty_rma_status", column: "status_id", primary_key: "status_id", name: "AMASTY_RMA_STATUS_STORE_STATUS_ID_AMASTY_RMA_STATUS_STATUS_ID", on_delete: :cascade
  add_foreign_key "amazon_customer", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "AMAZON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amazon_quote", "quote", primary_key: "entity_id", name: "AMAZON_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "amazon_sales_order", "sales_order", column: "order_id", primary_key: "entity_id", name: "AMAZON_SALES_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "app_account_posts", "app_accounts", column: "account_id"
  add_foreign_key "app_account_posts", "app_posts", column: "post_id"
  add_foreign_key "app_posts", "app_accounts", column: "account_id"
  add_foreign_key "app_tags", "app_accounts", column: "account_id"
  add_foreign_key "authorization_rule", "authorization_role", column: "role_id", primary_key: "role_id", name: "AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID", on_delete: :cascade
  add_foreign_key "braintree_transaction_details", "sales_order", column: "order_id", primary_key: "entity_id", name: "BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "brand_infos", "app_items", column: "app_items_id"
  add_foreign_key "bss_giftcard_amounts", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "BSS_GIFTCARD_AMOUNTS_AMOUNT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_amounts", "store_website", column: "website_id", primary_key: "website_id", name: "BSS_GIFTCARD_AMOUNTS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_history", "bss_giftcard_pattern_code", column: "code_id", primary_key: "code_id", name: "BSS_GIFTCARD_HISTORY_CODE_ID_BSS_GIFTCARD_PATTERN_CODE_CODE_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_pattern_code", "bss_giftcard_pattern", column: "pattern_id", primary_key: "pattern_id", name: "FK_1BD657E4A3BE655C23C16EFC6F15DF07", on_delete: :cascade
  add_foreign_key "bss_giftcard_pattern_code", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "BSS_GIFTCARD_PATTERN_CODE_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_pattern_code", "sales_order", column: "order_id", primary_key: "entity_id", name: "BSS_GIFTCARD_PATTERN_CODE_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_product_template", "bss_giftcard_template", column: "template_id", primary_key: "template_id", name: "FK_C7B832A72B029FF276EC0F39A6E101FA", on_delete: :cascade
  add_foreign_key "bss_giftcard_product_template", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "BSS_GIFTCARD_PRD_TEMPLATE_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "bss_giftcard_template_images", "bss_giftcard_template", column: "template_id", primary_key: "template_id", name: "FK_7C52B6589504DDD0ACF583262BBED9F2", on_delete: :cascade
  add_foreign_key "catalog_category_entity_datetime", "catalog_category_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_datetime", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_datetime", "store", primary_key: "store_id", name: "CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_decimal", "catalog_category_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_decimal", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_decimal", "store", primary_key: "store_id", name: "CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_int", "catalog_category_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_int", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_int", "store", primary_key: "store_id", name: "CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_text", "catalog_category_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_text", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_text", "store", primary_key: "store_id", name: "CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_varchar", "catalog_category_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_varchar", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_category_entity_varchar", "store", primary_key: "store_id", name: "CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_category_product", "catalog_category_entity", column: "category_id", primary_key: "entity_id", name: "CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_category_product", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_compare_item", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "catalog_compare_item", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "catalog_compare_item", "store", primary_key: "store_id", name: "CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "catalog_eav_attribute", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_option", "catalog_product_entity", column: "parent_id", primary_key: "entity_id", name: "CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_option_value", "catalog_product_bundle_option", column: "option_id", primary_key: "option_id", name: "CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_price_index", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_price_index", "customer_group", primary_key: "customer_group_id", name: "CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_price_index", "store_website", column: "website_id", primary_key: "website_id", name: "CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_selection", "catalog_product_bundle_option", column: "option_id", primary_key: "option_id", name: "CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_selection", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_selection_price", "catalog_product_bundle_selection", column: "selection_id", primary_key: "selection_id", name: "FK_DCF37523AA05D770A70AA4ED7C2616E4", on_delete: :cascade
  add_foreign_key "catalog_product_bundle_selection_price", "store_website", column: "website_id", primary_key: "website_id", name: "CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_datetime", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_datetime", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_datetime", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_decimal", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_decimal", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_decimal", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_gallery", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_gallery", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_gallery", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_int", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_int", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_int", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value", "catalog_product_entity_media_gallery", column: "value_id", primary_key: "value_id", name: "CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value", "store", primary_key: "store_id", name: "CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value_to_entity", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value_to_entity", "catalog_product_entity_media_gallery", column: "value_id", primary_key: "value_id", name: "FK_A6C6C8FAA386736921D3A7C4B50B1185", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value_video", "catalog_product_entity_media_gallery", column: "value_id", primary_key: "value_id", name: "FK_6FDF205946906B0E653E60AA769899F8", on_delete: :cascade
  add_foreign_key "catalog_product_entity_media_gallery_value_video", "store", primary_key: "store_id", name: "CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_text", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_text", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_text", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_tier_price", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_tier_price", "customer_group", primary_key: "customer_group_id", name: "CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_tier_price", "store_website", column: "website_id", primary_key: "website_id", name: "CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_varchar", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_varchar", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "catalog_product_entity_varchar", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_frontend_action", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_frontend_action", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_index_tier_price", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_index_tier_price", "customer_group", primary_key: "customer_group_id", name: "CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "catalog_product_index_tier_price", "store_website", column: "website_id", primary_key: "website_id", name: "CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "catalog_product_index_website", "store_website", column: "website_id", primary_key: "website_id", name: "CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link", "catalog_product_entity", column: "linked_product_id", primary_key: "entity_id", name: "CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link", "catalog_product_link_type", column: "link_type_id", primary_key: "link_type_id", name: "CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute", "catalog_product_link_type", column: "link_type_id", primary_key: "link_type_id", name: "CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_decimal", "catalog_product_link", column: "link_id", primary_key: "link_id", name: "CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_decimal", "catalog_product_link_attribute", column: "product_link_attribute_id", primary_key: "product_link_attribute_id", name: "FK_AB2EFA9A14F7BCF1D5400056203D14B6", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_int", "catalog_product_link", column: "link_id", primary_key: "link_id", name: "CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_int", "catalog_product_link_attribute", column: "product_link_attribute_id", primary_key: "product_link_attribute_id", name: "FK_D6D878F8BA2A4282F8DDED7E6E3DE35C", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_varchar", "catalog_product_link", column: "link_id", primary_key: "link_id", name: "CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID", on_delete: :cascade
  add_foreign_key "catalog_product_link_attribute_varchar", "catalog_product_link_attribute", column: "product_link_attribute_id", primary_key: "product_link_attribute_id", name: "FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51", on_delete: :cascade
  add_foreign_key "catalog_product_option", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_price", "catalog_product_option", column: "option_id", primary_key: "option_id", name: "CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_price", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_title", "catalog_product_option", column: "option_id", primary_key: "option_id", name: "CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_title", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_type_price", "catalog_product_option_type_value", column: "option_type_id", primary_key: "option_type_id", name: "FK_B523E3378E8602F376CC415825576B7F", on_delete: :cascade
  add_foreign_key "catalog_product_option_type_price", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_type_title", "catalog_product_option_type_value", column: "option_type_id", primary_key: "option_type_id", name: "FK_C085B9CF2C2A302E8043FDEA1937D6A2", on_delete: :cascade
  add_foreign_key "catalog_product_option_type_title", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_option_type_value", "catalog_product_option", column: "option_id", primary_key: "option_id", name: "CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_relation", "catalog_product_entity", column: "child_id", primary_key: "entity_id", name: "CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_relation", "catalog_product_entity", column: "parent_id", primary_key: "entity_id", name: "CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_super_attribute", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_super_attribute_label", "catalog_product_super_attribute", column: "product_super_attribute_id", primary_key: "product_super_attribute_id", name: "FK_309442281DF7784210ED82B2CC51E5D5", on_delete: :cascade
  add_foreign_key "catalog_product_super_attribute_label", "store", primary_key: "store_id", name: "CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "catalog_product_super_link", "catalog_product_entity", column: "parent_id", primary_key: "entity_id", name: "CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_super_link", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_website", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_product_website", "store_website", column: "website_id", primary_key: "website_id", name: "CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "catalog_url_rewrite_product_category", "catalog_category_entity", column: "category_id", primary_key: "entity_id", name: "CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_url_rewrite_product_category", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "catalog_url_rewrite_product_category", "url_rewrite", primary_key: "url_rewrite_id", name: "FK_BB79E64705D7F17FE181F23144528FC8", on_delete: :cascade
  add_foreign_key "cataloginventory_stock_item", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "cataloginventory_stock_item", "cataloginventory_stock", column: "stock_id", primary_key: "stock_id", name: "CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID", on_delete: :cascade
  add_foreign_key "catalogrule_customer_group", "catalogrule", column: "rule_id", primary_key: "rule_id", name: "CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "catalogrule_customer_group", "customer_group", primary_key: "customer_group_id", name: "CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "catalogrule_website", "catalogrule", column: "rule_id", primary_key: "rule_id", name: "CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "catalogrule_website", "store_website", column: "website_id", primary_key: "website_id", name: "CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "catalogsearch_recommendations", "search_query", column: "query_id", primary_key: "query_id", name: "CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID", on_delete: :cascade
  add_foreign_key "catalogsearch_recommendations", "search_query", column: "relation_id", primary_key: "query_id", name: "CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID", on_delete: :cascade
  add_foreign_key "checkout_agreement_store", "checkout_agreement", column: "agreement_id", primary_key: "agreement_id", name: "CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID", on_delete: :cascade
  add_foreign_key "checkout_agreement_store", "store", primary_key: "store_id", name: "CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "cms_block_store", "cms_block", column: "block_id", primary_key: "block_id", name: "CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID", on_delete: :cascade
  add_foreign_key "cms_block_store", "store", primary_key: "store_id", name: "CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "cms_page_store", "cms_page", column: "page_id", primary_key: "page_id", name: "CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID", on_delete: :cascade
  add_foreign_key "cms_page_store", "store", primary_key: "store_id", name: "CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_documents", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "COMMERCE9_SELLERPROFILE_DOCUMENTS_SELLER_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_seller_bank_details", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "FK_5543EB2CD30AFA01AB0ED1671B212466", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_seller_commercials", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "FK_63ED91C2FA5AC7D6F0943B57A5CB01EC", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_seller_operations", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "FK_94A36868AF8CD9F7874084D716EDE366", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_seller_profile", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "FK_C519FE42EA11B12323F5E542D0BFA05B", on_delete: :cascade
  add_foreign_key "commerce9_sellerprofile_supplier_details", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "FK_F5ED39FE81F9CE6F4F653F958F02A101", on_delete: :cascade
  add_foreign_key "customer_address_entity", "customer_entity", column: "parent_id", primary_key: "entity_id", name: "CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_datetime", "customer_address_entity", column: "entity_id", primary_key: "entity_id", name: "CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_datetime", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_decimal", "customer_address_entity", column: "entity_id", primary_key: "entity_id", name: "CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_decimal", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_int", "customer_address_entity", column: "entity_id", primary_key: "entity_id", name: "CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_int", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_text", "customer_address_entity", column: "entity_id", primary_key: "entity_id", name: "CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_text", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_varchar", "customer_address_entity", column: "entity_id", primary_key: "entity_id", name: "CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "customer_address_entity_varchar", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_eav_attribute", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_eav_attribute_website", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "customer_eav_attribute_website", "store_website", column: "website_id", primary_key: "website_id", name: "CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID", on_delete: :cascade
  add_foreign_key "customer_entity", "store", primary_key: "store_id", name: "CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "customer_entity", "store_website", column: "website_id", primary_key: "website_id", name: "CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :nullify
  add_foreign_key "customer_entity_datetime", "customer_entity", column: "entity_id", primary_key: "entity_id", name: "CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_entity_datetime", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_entity_decimal", "customer_entity", column: "entity_id", primary_key: "entity_id", name: "CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_entity_decimal", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_entity_int", "customer_entity", column: "entity_id", primary_key: "entity_id", name: "CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_entity_int", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_entity_text", "customer_entity", column: "entity_id", primary_key: "entity_id", name: "CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_entity_text", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_entity_varchar", "customer_entity", column: "entity_id", primary_key: "entity_id", name: "CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "customer_entity_varchar", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "customer_form_attribute", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "design_change", "store", primary_key: "store_id", name: "DESIGN_CHANGE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "directory_country_region_name", "directory_country_region", column: "region_id", primary_key: "region_id", name: "DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID", on_delete: :cascade
  add_foreign_key "downloadable_link", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "downloadable_link_price", "downloadable_link", column: "link_id", primary_key: "link_id", name: "DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID", on_delete: :cascade
  add_foreign_key "downloadable_link_price", "store_website", column: "website_id", primary_key: "website_id", name: "DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "downloadable_link_purchased", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID", on_delete: :nullify
  add_foreign_key "downloadable_link_purchased", "sales_order", column: "order_id", primary_key: "entity_id", name: "DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :nullify
  add_foreign_key "downloadable_link_purchased_item", "downloadable_link_purchased", column: "purchased_id", primary_key: "purchased_id", name: "DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID", on_delete: :cascade
  add_foreign_key "downloadable_link_purchased_item", "sales_order_item", column: "order_item_id", primary_key: "item_id", name: "DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID", on_delete: :nullify
  add_foreign_key "downloadable_link_title", "downloadable_link", column: "link_id", primary_key: "link_id", name: "DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID", on_delete: :cascade
  add_foreign_key "downloadable_link_title", "store", primary_key: "store_id", name: "DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "downloadable_sample", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "downloadable_sample_title", "downloadable_sample", column: "sample_id", primary_key: "sample_id", name: "DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID", on_delete: :cascade
  add_foreign_key "downloadable_sample_title", "store", primary_key: "store_id", name: "DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_group", "eav_attribute_set", column: "attribute_set_id", primary_key: "attribute_set_id", name: "EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_label", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_label", "store", primary_key: "store_id", name: "EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_option", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_option_swatch", "eav_attribute_option", column: "option_id", primary_key: "option_id", name: "EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_option_swatch", "store", primary_key: "store_id", name: "EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_option_value", "eav_attribute_option", column: "option_id", primary_key: "option_id", name: "EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_option_value", "store", primary_key: "store_id", name: "EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_attribute_set", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity", "store", primary_key: "store_id", name: "EAV_ENTITY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_attribute", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_attribute", "eav_attribute_group", column: "attribute_group_id", primary_key: "attribute_group_id", name: "EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "eav_entity_datetime", "eav_entity", column: "entity_id", primary_key: "entity_id", name: "EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "eav_entity_datetime", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_datetime", "store", primary_key: "store_id", name: "EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_decimal", "eav_entity", column: "entity_id", primary_key: "entity_id", name: "EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "eav_entity_decimal", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_decimal", "store", primary_key: "store_id", name: "EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_int", "eav_entity", column: "entity_id", primary_key: "entity_id", name: "EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "eav_entity_int", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_int", "store", primary_key: "store_id", name: "EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_store", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_store", "store", primary_key: "store_id", name: "EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_text", "eav_entity", column: "entity_id", primary_key: "entity_id", name: "EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "eav_entity_text", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_text", "store", primary_key: "store_id", name: "EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_varchar", "eav_entity", column: "entity_id", primary_key: "entity_id", name: "EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "eav_entity_varchar", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_entity_varchar", "store", primary_key: "store_id", name: "EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_form_element", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "eav_form_element", "eav_form_fieldset", column: "fieldset_id", primary_key: "fieldset_id", name: "EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID", on_delete: :nullify
  add_foreign_key "eav_form_element", "eav_form_type", column: "type_id", primary_key: "type_id", name: "EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_form_fieldset", "eav_form_type", column: "type_id", primary_key: "type_id", name: "EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_form_fieldset_label", "eav_form_fieldset", column: "fieldset_id", primary_key: "fieldset_id", name: "EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID", on_delete: :cascade
  add_foreign_key "eav_form_fieldset_label", "store", primary_key: "store_id", name: "EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_form_type", "store", primary_key: "store_id", name: "EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "eav_form_type_entity", "eav_entity_type", column: "entity_type_id", primary_key: "entity_type_id", name: "EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID", on_delete: :cascade
  add_foreign_key "eav_form_type_entity", "eav_form_type", column: "type_id", primary_key: "type_id", name: "EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID", on_delete: :cascade
  add_foreign_key "email_campaign", "store", primary_key: "store_id", name: "EMAIL_CAMPAIGN_STORE_ID_CORE/STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "email_catalog", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "EMAIL_CATALOG_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "email_contact", "store_website", column: "website_id", primary_key: "website_id", name: "EMAIL_CONTACT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "email_contact_consent", "email_contact", primary_key: "email_contact_id", name: "FK_17E9EA0C469163E550BC6B732AC49FDB", on_delete: :cascade
  add_foreign_key "email_coupon_attribute", "salesrule_coupon", primary_key: "coupon_id", name: "EMAIL_COUPON_ATTRIBUTE_COUPON_ID_SALESRULE_COUPON_COUPON_ID", on_delete: :cascade
  add_foreign_key "email_order", "sales_order", column: "order_id", primary_key: "entity_id", name: "EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "email_order", "store", primary_key: "store_id", name: "EMAIL_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "email_wishlist", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "EMAIL_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "email_wishlist", "wishlist", primary_key: "wishlist_id", name: "EMAIL_WISHLIST_WISHLIST_ID_WISHLIST_WISHLIST_ID", on_delete: :cascade
  add_foreign_key "firebear_export_history", "firebear_export_jobs", column: "job_id", primary_key: "entity_id", name: "FIREBEAR_EXPORT_HISTORY_JOB_ID_FIREBEAR_EXPORT_JOBS_ENTITY_ID", on_delete: :cascade
  add_foreign_key "firebear_export_jobs_event", "firebear_export_jobs", column: "job_id", primary_key: "entity_id", name: "FIREBEAR_EXPORT_JOBS_EVENT_JOB_ID_FIREBEAR_EXPORT_JOBS_ENTITY_ID", on_delete: :cascade
  add_foreign_key "firebear_import_history", "firebear_import_jobs", column: "job_id", primary_key: "entity_id", name: "FIREBEAR_IMPORT_HISTORY_JOB_ID_FIREBEAR_IMPORT_JOBS_ENTITY_ID", on_delete: :cascade
  add_foreign_key "firebear_import_job_mapping", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "IMPORT_JOB_MAPPING_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "firebear_import_job_mapping", "firebear_import_jobs", column: "job_id", primary_key: "entity_id", name: "IMPORT_JOB_MAPPING_JOB_ID_IMPORT_JOBS_ENTITY_ID", on_delete: :cascade
  add_foreign_key "firebear_importexport_importdata", "firebear_import_jobs", column: "job_id", primary_key: "entity_id", name: "FK_9AF4AC7F682E8FAAE2A91E723745CB33", on_delete: :cascade
  add_foreign_key "googleoptimizer_code", "store", primary_key: "store_id", name: "GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "integration", "oauth_consumer", column: "consumer_id", primary_key: "entity_id", name: "INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "inventory_order_notification", "sales_order", column: "order_id", primary_key: "entity_id", name: "INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "inventory_pickup_location_order", "sales_order", column: "order_id", primary_key: "entity_id", name: "INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "inventory_pickup_location_quote_address", "quote_address", column: "address_id", primary_key: "address_id", name: "INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID", on_delete: :cascade
  add_foreign_key "inventory_source_carrier_link", "inventory_source", column: "source_code", primary_key: "source_code", name: "INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE", on_delete: :cascade
  add_foreign_key "inventory_source_item", "inventory_source", column: "source_code", primary_key: "source_code", name: "INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE", on_delete: :cascade
  add_foreign_key "inventory_source_stock_link", "inventory_source", column: "source_code", primary_key: "source_code", name: "INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE", on_delete: :cascade
  add_foreign_key "inventory_source_stock_link", "inventory_stock", column: "stock_id", primary_key: "stock_id", name: "INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID", on_delete: :cascade
  add_foreign_key "inventory_stock_sales_channel", "inventory_stock", column: "stock_id", primary_key: "stock_id", name: "INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID", on_delete: :cascade
  add_foreign_key "item_option_types", "option_types"
  add_foreign_key "item_option_types", "option_values"
  add_foreign_key "layout_link", "layout_update", primary_key: "layout_update_id", name: "LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID", on_delete: :cascade
  add_foreign_key "layout_link", "store", primary_key: "store_id", name: "LAYOUT_LINK_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "layout_link", "theme", primary_key: "theme_id", name: "LAYOUT_LINK_THEME_ID_THEME_THEME_ID", on_delete: :cascade
  add_foreign_key "login_as_customer_assistance_allowed", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "LOGIN_AS_CSTR_ASSISTANCE_ALLOWED_CSTR_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_category_store", "magefan_blog_category", column: "category_id", primary_key: "category_id", name: "MAGEFAN_BLOG_CTGR_STORE_CTGR_ID_MAGEFAN_BLOG_CTGR_CTGR_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_category_store", "store", primary_key: "store_id", name: "MAGEFAN_BLOG_CATEGORY_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_comment", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_COMMENT_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_category", "magefan_blog_category", column: "category_id", primary_key: "category_id", name: "MAGEFAN_BLOG_POST_CTGR_CTGR_ID_MAGEFAN_BLOG_CTGR_CTGR_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_category", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_POST_CATEGORY_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_relatedpost", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "FK_9F26E983FE1D7D7063B61D3F3C8D1104", on_delete: :cascade
  add_foreign_key "magefan_blog_post_relatedpost", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_POST_RELATEDPRD1_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_relatedproduct", "catalog_product_entity", column: "related_id", primary_key: "entity_id", name: "MAGEFAN_BLOG_POST_RELATEDPRD_RELATED_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_relatedproduct", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_POST_RELATEDPRD_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_store", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_POST_STORE_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_store", "store", primary_key: "store_id", name: "MAGEFAN_BLOG_POST_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_tag", "magefan_blog_post", column: "post_id", primary_key: "post_id", name: "MAGEFAN_BLOG_POST_TAG_POST_ID_MAGEFAN_BLOG_POST_POST_ID", on_delete: :cascade
  add_foreign_key "magefan_blog_post_tag", "magefan_blog_tag", column: "tag_id", primary_key: "tag_id", name: "MAGEFAN_BLOG_POST_TAG_TAG_ID_MAGEFAN_BLOG_TAG_TAG_ID", on_delete: :cascade
  add_foreign_key "magento_acknowledged_bulk", "magento_bulk", column: "bulk_uuid", primary_key: "uuid", name: "MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID", on_delete: :cascade
  add_foreign_key "magento_operation", "magento_bulk", column: "bulk_uuid", primary_key: "uuid", name: "MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID", on_delete: :cascade
  add_foreign_key "mageplaza_bannerslider_banner_slider", "mageplaza_bannerslider_banner", column: "banner_id", primary_key: "banner_id", name: "FK_824689F307EEDC9AF4DD5A7D11110615", on_delete: :cascade
  add_foreign_key "mageplaza_bannerslider_banner_slider", "mageplaza_bannerslider_slider", column: "slider_id", primary_key: "slider_id", name: "FK_988AB80B5D2DF60CAD31BAFF020B3903", on_delete: :cascade
  add_foreign_key "mageplaza_smtp_abandonedcart", "quote", primary_key: "entity_id", name: "MAGEPLAZA_SMTP_ABANDONEDCART_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_datafeedback", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "MARKETPLACE_DATAFEEDBACK_SELLER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_feedbackcount", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "MARKETPLACE_FEEDBACKCOUNT_SELLER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_orders", "sales_order", column: "order_id", primary_key: "entity_id", name: "MARKETPLACE_ORDERS_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_product", "catalog_product_entity", column: "mageproduct_id", primary_key: "entity_id", name: "MARKETPLACE_PRD_MAGEPRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "marketplace_productflags", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "MARKETPLACE_PRDFLAGS_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "marketplace_saleslist", "sales_order", column: "order_id", primary_key: "entity_id", name: "MARKETPLACE_SALESLIST_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_sellerflags", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "MARKETPLACE_SELLERFLAGS_SELLER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "marketplace_sellertransaction", "customer_entity", column: "seller_id", primary_key: "entity_id", name: "MARKETPLACE_SELLERTRANSACTION_SELLER_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "media_gallery_asset_keyword", "media_gallery_asset", column: "asset_id", name: "MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID_MEDIA_GALLERY_ASSET_ID", on_delete: :cascade
  add_foreign_key "media_gallery_asset_keyword", "media_gallery_keyword", column: "keyword_id", name: "MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID_MEDIA_GALLERY_KEYWORD_ID", on_delete: :cascade
  add_foreign_key "newsletter_problem", "newsletter_queue", column: "queue_id", primary_key: "queue_id", name: "NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID", on_delete: :cascade
  add_foreign_key "newsletter_problem", "newsletter_subscriber", column: "subscriber_id", primary_key: "subscriber_id", name: "NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID", on_delete: :cascade
  add_foreign_key "newsletter_queue", "newsletter_template", column: "template_id", primary_key: "template_id", name: "NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID", on_delete: :cascade
  add_foreign_key "newsletter_queue_link", "newsletter_queue", column: "queue_id", primary_key: "queue_id", name: "NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID", on_delete: :cascade
  add_foreign_key "newsletter_queue_link", "newsletter_subscriber", column: "subscriber_id", primary_key: "subscriber_id", name: "NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID", on_delete: :cascade
  add_foreign_key "newsletter_queue_store_link", "newsletter_queue", column: "queue_id", primary_key: "queue_id", name: "NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID", on_delete: :cascade
  add_foreign_key "newsletter_queue_store_link", "store", primary_key: "store_id", name: "NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "newsletter_subscriber", "store", primary_key: "store_id", name: "NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "oauth_nonce", "oauth_consumer", column: "consumer_id", primary_key: "entity_id", name: "OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "oauth_token", "admin_user", column: "admin_id", primary_key: "user_id", name: "OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "oauth_token", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "oauth_token", "oauth_consumer", column: "consumer_id", primary_key: "entity_id", name: "OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "paypal_billing_agreement", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "paypal_billing_agreement", "store", primary_key: "store_id", name: "PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "paypal_billing_agreement_order", "paypal_billing_agreement", column: "agreement_id", primary_key: "agreement_id", name: "PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID", on_delete: :cascade
  add_foreign_key "paypal_billing_agreement_order", "sales_order", column: "order_id", primary_key: "entity_id", name: "PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "paypal_cert", "store_website", column: "website_id", primary_key: "website_id", name: "PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "paypal_settlement_report_row", "paypal_settlement_report", column: "report_id", primary_key: "report_id", name: "FK_E183E488F593E0DE10C6EBFFEBAC9B55", on_delete: :cascade
  add_foreign_key "persistent_session", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "persistent_session", "store_website", column: "website_id", primary_key: "website_id", name: "PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "product_alert_price", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "product_alert_price", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "product_alert_price", "store", primary_key: "store_id", name: "PRODUCT_ALERT_PRICE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "product_alert_price", "store_website", column: "website_id", primary_key: "website_id", name: "PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "product_alert_stock", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "product_alert_stock", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "product_alert_stock", "store", primary_key: "store_id", name: "PRODUCT_ALERT_STOCK_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "product_alert_stock", "store_website", column: "website_id", primary_key: "website_id", name: "PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "queue_message_status", "queue", name: "QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID", on_delete: :cascade
  add_foreign_key "queue_message_status", "queue_message", column: "message_id", name: "QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID", on_delete: :cascade
  add_foreign_key "quote", "store", primary_key: "store_id", name: "QUOTE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "quote_address", "quote", primary_key: "entity_id", name: "QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "quote_address_item", "quote_address", primary_key: "address_id", name: "QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID", on_delete: :cascade
  add_foreign_key "quote_address_item", "quote_address_item", column: "parent_item_id", primary_key: "address_item_id", name: "QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID", on_delete: :cascade
  add_foreign_key "quote_address_item", "quote_item", primary_key: "item_id", name: "QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID", on_delete: :cascade
  add_foreign_key "quote_id_mask", "quote", primary_key: "entity_id", name: "QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "quote_item", "quote", primary_key: "entity_id", name: "QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "quote_item", "quote_item", column: "parent_item_id", primary_key: "item_id", name: "QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID", on_delete: :cascade
  add_foreign_key "quote_item", "store", primary_key: "store_id", name: "QUOTE_ITEM_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "quote_item_option", "quote_item", column: "item_id", primary_key: "item_id", name: "QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID", on_delete: :cascade
  add_foreign_key "quote_payment", "quote", primary_key: "entity_id", name: "QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "quote_shipping_rate", "quote_address", column: "address_id", primary_key: "address_id", name: "QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID", on_delete: :cascade
  add_foreign_key "rating", "rating_entity", column: "entity_id", primary_key: "entity_id", name: "RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "rating_option", "rating", primary_key: "rating_id", name: "RATING_OPTION_RATING_ID_RATING_RATING_ID", on_delete: :cascade
  add_foreign_key "rating_option_vote", "rating_option", column: "option_id", primary_key: "option_id", name: "RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID", on_delete: :cascade
  add_foreign_key "rating_option_vote", "review", primary_key: "review_id", name: "RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID", on_delete: :cascade
  add_foreign_key "rating_option_vote_aggregated", "rating", primary_key: "rating_id", name: "RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID", on_delete: :cascade
  add_foreign_key "rating_option_vote_aggregated", "store", primary_key: "store_id", name: "RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "rating_store", "rating", primary_key: "rating_id", name: "RATING_STORE_RATING_ID_RATING_RATING_ID", on_delete: :cascade
  add_foreign_key "rating_store", "store", primary_key: "store_id", name: "RATING_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "rating_title", "rating", primary_key: "rating_id", name: "RATING_TITLE_RATING_ID_RATING_RATING_ID", on_delete: :cascade
  add_foreign_key "rating_title", "store", primary_key: "store_id", name: "RATING_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "release_notification_viewer_log", "admin_user", column: "viewer_id", primary_key: "user_id", name: "RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "report_compared_product_index", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_compared_product_index", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_compared_product_index", "store", primary_key: "store_id", name: "REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "report_event", "report_event_types", column: "event_type_id", primary_key: "event_type_id", name: "REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID", on_delete: :cascade
  add_foreign_key "report_event", "store", primary_key: "store_id", name: "REPORT_EVENT_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_daily", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_daily", "store", primary_key: "store_id", name: "REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_monthly", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_monthly", "store", primary_key: "store_id", name: "REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_yearly", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_aggregated_yearly", "store", primary_key: "store_id", name: "REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_index", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_index", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID", on_delete: :cascade
  add_foreign_key "report_viewed_product_index", "store", primary_key: "store_id", name: "REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "review", "review_entity", column: "entity_id", primary_key: "entity_id", name: "REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "review", "review_status", column: "status_id", primary_key: "status_id", name: "REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID"
  add_foreign_key "review_detail", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :nullify
  add_foreign_key "review_detail", "review", primary_key: "review_id", name: "REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID", on_delete: :cascade
  add_foreign_key "review_detail", "store", primary_key: "store_id", name: "REVIEW_DETAIL_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "review_entity_summary", "store", primary_key: "store_id", name: "REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "review_store", "review", primary_key: "review_id", name: "REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID", on_delete: :cascade
  add_foreign_key "review_store", "store", primary_key: "store_id", name: "REVIEW_STORE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "sales_bestsellers_aggregated_daily", "store", primary_key: "store_id", name: "SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "sales_bestsellers_aggregated_monthly", "store", primary_key: "store_id", name: "SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "sales_bestsellers_aggregated_yearly", "store", primary_key: "store_id", name: "SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "sales_creditmemo", "sales_order", column: "order_id", primary_key: "entity_id", name: "SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_creditmemo", "store", primary_key: "store_id", name: "SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_creditmemo_comment", "sales_creditmemo", column: "parent_id", primary_key: "entity_id", name: "SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_creditmemo_item", "sales_creditmemo", column: "parent_id", primary_key: "entity_id", name: "SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_invoice", "sales_order", column: "order_id", primary_key: "entity_id", name: "SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_invoice", "store", primary_key: "store_id", name: "SALES_INVOICE_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_invoice_comment", "sales_invoice", column: "parent_id", primary_key: "entity_id", name: "SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_invoice_item", "sales_invoice", column: "parent_id", primary_key: "entity_id", name: "SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_invoiced_aggregated", "store", primary_key: "store_id", name: "SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_invoiced_aggregated_order", "store", primary_key: "store_id", name: "SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_order", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :nullify
  add_foreign_key "sales_order", "store", primary_key: "store_id", name: "SALES_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_order_address", "sales_order", column: "parent_id", primary_key: "entity_id", name: "SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_order_aggregated_created", "store", primary_key: "store_id", name: "SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_order_aggregated_updated", "store", primary_key: "store_id", name: "SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_order_item", "sales_order", column: "order_id", primary_key: "entity_id", name: "SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_order_item", "store", primary_key: "store_id", name: "SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_order_payment", "sales_order", column: "parent_id", primary_key: "entity_id", name: "SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_order_status_history", "sales_order", column: "parent_id", primary_key: "entity_id", name: "SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_order_status_label", "sales_order_status", column: "status", primary_key: "status", name: "SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS", on_delete: :cascade
  add_foreign_key "sales_order_status_label", "store", primary_key: "store_id", name: "SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "sales_order_status_state", "sales_order_status", column: "status", primary_key: "status", name: "SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS", on_delete: :cascade
  add_foreign_key "sales_order_tax_item", "sales_order_item", column: "associated_item_id", primary_key: "item_id", name: "SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID", on_delete: :cascade
  add_foreign_key "sales_order_tax_item", "sales_order_item", column: "item_id", primary_key: "item_id", name: "SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID", on_delete: :cascade
  add_foreign_key "sales_order_tax_item", "sales_order_tax", column: "tax_id", primary_key: "tax_id", name: "SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID", on_delete: :cascade
  add_foreign_key "sales_payment_transaction", "sales_order", column: "order_id", primary_key: "entity_id", name: "SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_payment_transaction", "sales_order_payment", column: "payment_id", primary_key: "entity_id", name: "SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID", on_delete: :cascade
  add_foreign_key "sales_payment_transaction", "sales_payment_transaction", column: "parent_id", primary_key: "transaction_id", name: "FK_B99FF1A06402D725EBDB0F3A7ECD47A2", on_delete: :cascade
  add_foreign_key "sales_refunded_aggregated", "store", primary_key: "store_id", name: "SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_refunded_aggregated_order", "store", primary_key: "store_id", name: "SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_sequence_profile", "sales_sequence_meta", column: "meta_id", primary_key: "meta_id", name: "SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID", on_delete: :cascade
  add_foreign_key "sales_shipment", "sales_order", column: "order_id", primary_key: "entity_id", name: "SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_shipment", "store", primary_key: "store_id", name: "SALES_SHIPMENT_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_shipment_comment", "sales_shipment", column: "parent_id", primary_key: "entity_id", name: "SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_shipment_item", "sales_shipment", column: "parent_id", primary_key: "entity_id", name: "SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_shipment_track", "sales_shipment", column: "parent_id", primary_key: "entity_id", name: "SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID", on_delete: :cascade
  add_foreign_key "sales_shipping_aggregated", "store", primary_key: "store_id", name: "SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "sales_shipping_aggregated_order", "store", primary_key: "store_id", name: "SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "salesrule_coupon", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_coupon_aggregated", "store", primary_key: "store_id", name: "SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "salesrule_coupon_aggregated_order", "store", primary_key: "store_id", name: "SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "salesrule_coupon_aggregated_updated", "store", primary_key: "store_id", name: "SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "salesrule_coupon_usage", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "salesrule_coupon_usage", "salesrule_coupon", column: "coupon_id", primary_key: "coupon_id", name: "SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID", on_delete: :cascade
  add_foreign_key "salesrule_customer", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "salesrule_customer", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_customer_group", "customer_group", primary_key: "customer_group_id", name: "SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "salesrule_customer_group", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_label", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_label", "store", primary_key: "store_id", name: "SALESRULE_LABEL_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "salesrule_product_attribute", "customer_group", primary_key: "customer_group_id", name: "SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID", on_delete: :cascade
  add_foreign_key "salesrule_product_attribute", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID", on_delete: :cascade
  add_foreign_key "salesrule_product_attribute", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_product_attribute", "store_website", column: "website_id", primary_key: "website_id", name: "SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "salesrule_website", "salesrule", column: "rule_id", primary_key: "rule_id", name: "SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID", on_delete: :cascade
  add_foreign_key "salesrule_website", "store_website", column: "website_id", primary_key: "website_id", name: "SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "search_query", "store", primary_key: "store_id", name: "SEARCH_QUERY_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "search_synonyms", "store", primary_key: "store_id", name: "SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "search_synonyms", "store_website", column: "website_id", primary_key: "website_id", name: "SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "signifyd_case", "sales_order", column: "order_id", primary_key: "entity_id", name: "SIGNIFYD_CASE_ORDER_ID_SALES_ORDER_ENTITY_ID", on_delete: :nullify
  add_foreign_key "sitemap", "store", primary_key: "store_id", name: "SITEMAP_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "store", "store_group", column: "group_id", primary_key: "group_id", name: "STORE_GROUP_ID_STORE_GROUP_GROUP_ID", on_delete: :cascade
  add_foreign_key "store", "store_website", column: "website_id", primary_key: "website_id", name: "STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "store_group", "store_website", column: "website_id", primary_key: "website_id", name: "STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "tax_calculation", "tax_calculation_rate", primary_key: "tax_calculation_rate_id", name: "TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID", on_delete: :cascade
  add_foreign_key "tax_calculation", "tax_calculation_rule", primary_key: "tax_calculation_rule_id", name: "TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID", on_delete: :cascade
  add_foreign_key "tax_calculation", "tax_class", column: "customer_tax_class_id", primary_key: "class_id", name: "TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID", on_delete: :cascade
  add_foreign_key "tax_calculation", "tax_class", column: "product_tax_class_id", primary_key: "class_id", name: "TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID", on_delete: :cascade
  add_foreign_key "tax_calculation_rate_title", "store", primary_key: "store_id", name: "TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "tax_calculation_rate_title", "tax_calculation_rate", primary_key: "tax_calculation_rate_id", name: "FK_37FB965F786AD5897BB3AE90470C42AB", on_delete: :cascade
  add_foreign_key "tax_order_aggregated_created", "store", primary_key: "store_id", name: "TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "tax_order_aggregated_updated", "store", primary_key: "store_id", name: "TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "theme_file", "theme", primary_key: "theme_id", name: "THEME_FILE_THEME_ID_THEME_THEME_ID", on_delete: :cascade
  add_foreign_key "translation", "store", primary_key: "store_id", name: "TRANSLATION_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "ui_bookmark", "admin_user", column: "user_id", primary_key: "user_id", name: "UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID", on_delete: :cascade
  add_foreign_key "variable_value", "store", primary_key: "store_id", name: "VARIABLE_VALUE_STORE_ID_STORE_STORE_ID", on_delete: :cascade
  add_foreign_key "variable_value", "variable", primary_key: "variable_id", name: "VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID", on_delete: :cascade
  add_foreign_key "vault_payment_token", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "vault_payment_token_order_payment_link", "sales_order_payment", column: "order_payment_id", primary_key: "entity_id", name: "FK_CF37B9D854256534BE23C818F6291CA2", on_delete: :cascade
  add_foreign_key "vault_payment_token_order_payment_link", "vault_payment_token", column: "payment_token_id", primary_key: "entity_id", name: "FK_4ED894655446D385894580BECA993862", on_delete: :cascade
  add_foreign_key "weee_tax", "catalog_product_entity", column: "entity_id", primary_key: "entity_id", name: "WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "weee_tax", "directory_country", column: "country", primary_key: "country_id", name: "WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID", on_delete: :cascade
  add_foreign_key "weee_tax", "eav_attribute", column: "attribute_id", primary_key: "attribute_id", name: "WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID", on_delete: :cascade
  add_foreign_key "weee_tax", "store_website", column: "website_id", primary_key: "website_id", name: "WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID", on_delete: :cascade
  add_foreign_key "widget_instance", "theme", primary_key: "theme_id", name: "WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID", on_delete: :cascade
  add_foreign_key "widget_instance_page", "widget_instance", column: "instance_id", primary_key: "instance_id", name: "WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID", on_delete: :cascade
  add_foreign_key "widget_instance_page_layout", "layout_update", primary_key: "layout_update_id", name: "WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID", on_delete: :cascade
  add_foreign_key "widget_instance_page_layout", "widget_instance_page", column: "page_id", primary_key: "page_id", name: "WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID", on_delete: :cascade
  add_foreign_key "wishlist", "customer_entity", column: "customer_id", primary_key: "entity_id", name: "WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "wishlist_item", "catalog_product_entity", column: "product_id", primary_key: "entity_id", name: "WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID", on_delete: :cascade
  add_foreign_key "wishlist_item", "store", primary_key: "store_id", name: "WISHLIST_ITEM_STORE_ID_STORE_STORE_ID", on_delete: :nullify
  add_foreign_key "wishlist_item", "wishlist", primary_key: "wishlist_id", name: "WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID", on_delete: :cascade
  add_foreign_key "wishlist_item_option", "wishlist_item", primary_key: "wishlist_item_id", name: "FK_A014B30B04B72DD0EAB3EECD779728D6", on_delete: :cascade
end
