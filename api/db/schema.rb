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

ActiveRecord::Schema[7.1].define(version: 2024_07_25_201305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_customers_on_city"
    t.index ["state"], name: "index_customers_on_state"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_makes_on_name"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
    t.index ["name"], name: "index_models_on_name"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "type"
    t.integer "interval_miles"
    t.integer "interval_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name"
    t.index ["type"], name: "index_services_on_type"
  end

  create_table "sub_models", force: :cascade do |t|
    t.string "name"
    t.integer "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_sub_models_on_model_id"
    t.index ["name"], name: "index_sub_models_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "make_id"
    t.integer "model_id"
    t.string "year"
    t.string "vin"
    t.integer "miles"
    t.string "color"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sub_model_id"
    t.index ["customer_id"], name: "index_vehicles_on_customer_id"
    t.index ["make_id"], name: "index_vehicles_on_make_id"
    t.index ["model_id"], name: "index_vehicles_on_model_id"
    t.index ["name"], name: "index_vehicles_on_name"
    t.index ["sub_model_id"], name: "index_vehicles_on_sub_model_id"
    t.index ["type"], name: "index_vehicles_on_type"
    t.index ["vin"], name: "index_vehicles_on_vin", unique: true
    t.index ["year"], name: "index_vehicles_on_year"
  end

end
