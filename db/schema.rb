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


ActiveRecord::Schema.define(version: 2018_10_02_161645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_confidentials", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "city"
    t.string "county"
    t.boolean "first_kit"
    t.bigint "client_confidential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_confidential_id"], name: "index_clients_on_client_confidential_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.integer "number_kits"
    t.string "kit_type"
    t.date "date_distribution"
    t.date "date_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serial_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "auth_token"
    t.string "password_digest"
    t.string "email"
    t.integer "phone"
    t.string "county"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.boolean "admin"
    t.string "contact_type"
    t.date "date_auth"
    t.date "admin_auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

  add_foreign_key "clients", "client_confidentials"
end
