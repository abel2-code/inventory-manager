# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_06_210225) do

  create_table "gc_branches", force: :cascade do |t|
    t.string "city"
    t.integer "company_bank_acct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.integer "bank_account"
    t.boolean "is_a_student?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_exchanges", force: :cascade do |t|
    t.integer "musician_id", null: false
    t.integer "product_id", null: false
    t.string "exchange_type"
    t.boolean "refundable?"
    t.integer "total_number_scheduled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musician_id"], name: "index_product_exchanges_on_musician_id"
    t.index ["product_id"], name: "index_product_exchanges_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_type"
    t.string "brand"
    t.integer "serial"
    t.integer "purchase_cost"
    t.boolean "available?"
    t.boolean "rentable?"
    t.integer "rate_for_rental"
    t.integer "gc_branch_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repair_requests", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "repair_shop_id", null: false
    t.integer "cost"
    t.datetime "date_of_return"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_repair_requests_on_product_id"
    t.index ["repair_shop_id"], name: "index_repair_requests_on_repair_shop_id"
  end

  create_table "repair_shops", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "product_exchanges", "musicians"
  add_foreign_key "product_exchanges", "products"
  add_foreign_key "repair_requests", "products"
  add_foreign_key "repair_requests", "repair_shops"
end
