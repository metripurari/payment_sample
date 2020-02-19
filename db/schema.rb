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

ActiveRecord::Schema.define(version: 2020_02_20_100416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "email"
    t.boolean "status"
    t.float "total_transaction_sum", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "code"
    t.datetime "expiry"
    t.binary "salt"
    t.binary "key"
    t.bigint "merchant_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_tokens_on_merchant_id"
  end

  create_table "transaction_details", force: :cascade do |t|
    t.string "card_no"
    t.string "expiry"
    t.string "card_owner"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_transaction_details_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "uuid"
    t.float "amount"
    t.boolean "status"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "transaction_id"
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
  end

  add_foreign_key "transactions", "merchants"
end
