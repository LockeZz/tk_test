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

ActiveRecord::Schema.define(version: 2021_03_04_082609) do

  create_table "claim_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "claims", force: :cascade do |t|
    t.string "claim_name"
    t.decimal "amount"
    t.date "claim_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "claim_type_id"
    t.integer "staff_id"
    t.index ["claim_type_id"], name: "index_claims_on_claim_type_id"
    t.index ["staff_id"], name: "index_claims_on_staff_id"
  end

  create_table "claimtype_departments", force: :cascade do |t|
    t.integer "claim_type_id", null: false
    t.integer "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["claim_type_id"], name: "index_claimtype_departments_on_claim_type_id"
    t.index ["department_id"], name: "index_claimtype_departments_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "claims", "claim_types"
  add_foreign_key "claims", "staffs"
  add_foreign_key "claimtype_departments", "claim_types"
  add_foreign_key "claimtype_departments", "departments"
end
