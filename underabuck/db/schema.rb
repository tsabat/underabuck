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

ActiveRecord::Schema.define(version: 2018_05_09_225208) do

  create_table "available_charges", force: :cascade do |t|
    t.integer "product_id"
    t.integer "vendor_id"
    t.integer "charge_id"
    t.string "charge_type"
    t.string "charge_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fob_points", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "product_id"
    t.string "fob_id"
    t.string "fob_city"
    t.string "fob_state"
    t.string "fob_postal_code"
    t.string "fob_country"
    t.string "currency_supported"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_id"
    t.string "product_name"
    t.text "description"
    t.text "product_marketing"
    t.string "product_brand"
    t.string "export"
    t.string "product_category"
    t.string "product_sub_category"
    t.string "part_id"
    t.string "color"
    t.text "primary_material"
    t.text "dimension"
    t.integer "is_rush_service"
    t.text "shipping"
    t.boolean "is_closeout"
    t.boolean "is_on_demand"
    t.boolean "is_hasmat"
    t.datetime "last_change_date"
    t.datetime "creation_date"
    t.string "line_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellables", force: :cascade do |t|
    t.integer "vendor_id"
    t.string "product_id"
    t.string "part_id"
    t.integer "import_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
