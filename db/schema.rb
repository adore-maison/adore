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

ActiveRecord::Schema.define(version: 2021_04_07_164653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keywords", force: :cascade do |t|
    t.string "phrase"
    t.integer "volume"
    t.integer "ciq_score"
    t.integer "cpr_eight_day_giveaway"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_keywords_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "asin"
    t.text "description"
    t.string "photo_url"
    t.decimal "l_cm", precision: 15, scale: 2
    t.decimal "b_cm", precision: 15, scale: 2
    t.decimal "h_cm", precision: 15, scale: 2
    t.decimal "weight_kg", precision: 15, scale: 2
    t.decimal "target_selling_price", precision: 15, scale: 2
    t.decimal "launch_price", precision: 15, scale: 2
    t.integer "units_needed_to_rank"
    t.integer "units_per_master_carton"
    t.integer "target_sales_per_day"
    t.integer "mfg_time_days"
    t.integer "ship_to_amz_days"
    t.string "hsn"
    t.string "main_category"
    t.decimal "amz_referal_rate", precision: 15, scale: 2
    t.decimal "amz_fixed_closing_fee", precision: 15, scale: 2
    t.decimal "fba_fees", precision: 15, scale: 2
    t.decimal "gst_on_fees", precision: 15, scale: 2
    t.decimal "target_ppc_tacos", precision: 15, scale: 2
    t.decimal "estimated_unusable_units_perc", precision: 15, scale: 2
    t.decimal "bank_charges", precision: 15, scale: 2
    t.decimal "monthly_storage", precision: 15, scale: 2
    t.decimal "shipping", precision: 15, scale: 2
    t.decimal "inventory_placement", precision: 15, scale: 2
    t.decimal "other_shipping_storage_charges", precision: 15, scale: 2
    t.integer "order_quantity"
    t.decimal "factory_price", precision: 15, scale: 2
    t.decimal "manuf_labels_cost_perc", precision: 15, scale: 2
    t.decimal "manuf_box_cost_perc", precision: 15, scale: 2
    t.decimal "manuf_mould_cost_perc", precision: 15, scale: 2
    t.decimal "manuf_print_cost_perc", precision: 15, scale: 2
    t.decimal "manuf_other_cost_perc", precision: 15, scale: 2
    t.decimal "manuf_inspection_cost", precision: 15, scale: 2
    t.decimal "fc_freight", precision: 15, scale: 2
    t.decimal "fc_customs", precision: 15, scale: 2
    t.decimal "fc_cartons", precision: 15, scale: 2
    t.decimal "fc_freight_forwarder_fees", precision: 15, scale: 2
    t.decimal "c_photographer", precision: 15, scale: 2
    t.decimal "c_photo_edits", precision: 15, scale: 2
    t.decimal "c_stock_images", precision: 15, scale: 2
    t.decimal "c_other_1", precision: 15, scale: 2
    t.decimal "c_other_2", precision: 15, scale: 2
    t.decimal "other_costs", precision: 15, scale: 2
    t.decimal "inventory_roll_per_year", precision: 15, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_restricted", default: false
    t.boolean "big_branded", default: false
    t.boolean "has_glass", default: false
    t.boolean "has_sharp_edges", default: false
    t.boolean "has_too_many_variations", default: false
    t.boolean "is_seasonal", default: false
    t.boolean "sales_uptrend", default: false
    t.integer "stage", default: 0
    t.decimal "comp_price", precision: 15, scale: 2
    t.integer "comp_sales", default: 0
    t.integer "comp_revenue", default: 0
    t.decimal "comp_fba_fees", precision: 15, scale: 2
    t.decimal "comp_rating", precision: 15, scale: 2
    t.integer "comp_review_count", default: 0
    t.string "main_keyword"
    t.text "comments"
    t.string "dimension"
    t.string "amz_size"
  end

  create_table "selection_rules", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "selection_standard_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_selection_rules_on_product_id"
    t.index ["selection_standard_id"], name: "index_selection_rules_on_selection_standard_id"
  end

  create_table "selection_standards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "filter_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "keywords", "products"
end
