# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150518164424) do

  create_table "cart_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "cart_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "identity"
    t.string   "phone"
    t.string   "direction"
    t.string   "postal_code"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name",                                     null: false
    t.string   "description",                              null: false
    t.decimal  "price",           precision: 10, scale: 0, null: false
    t.decimal  "weight",          precision: 10, scale: 0, null: false
    t.string   "dimensions",                               null: false
    t.integer  "manufacturer_id",                          null: false
    t.string   "socket"
    t.string   "TDP"
    t.integer  "number_cores"
    t.integer  "core_frequency"
    t.string   "factor"
    t.integer  "video_memory"
    t.string   "pci_version"
    t.integer  "watts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["manufacturer_id"], name: "fk_item_manufacturer", using: :btree

  create_table "items_providers", force: true do |t|
    t.integer "provider_id", null: false
    t.integer "item_id",     null: false
  end

  add_index "items_providers", ["item_id"], name: "fk_items_providers_items", using: :btree
  add_index "items_providers", ["provider_id"], name: "fk_items_providers_providers", using: :btree

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "tlf"
    t.string   "direction"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "tlf"
    t.string   "direction"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                           null: false
    t.string   "login",                          null: false
    t.string   "email",                          null: false
    t.string   "crypted_password",               null: false
    t.string   "password_salt",                  null: false
    t.string   "persistence_token",              null: false
    t.string   "perishable_token",               null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
