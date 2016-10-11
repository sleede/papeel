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

ActiveRecord::Schema.define(version: 20161011115632) do

  create_table "forums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papeel_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "papeel_roles", ["name"], name: "index_papeel_roles_on_name"
  add_index "papeel_roles", ["resource_type", "resource_id", "name"], name: "index_papeel_roles_on_resource_type_and_resource_id_and_name"
  add_index "papeel_roles", ["resource_type", "resource_id"], name: "index_papeel_roles_on_resource_type_and_resource_id"
  add_index "papeel_roles", ["user_id", "name"], name: "index_papeel_roles_on_user_id_and_name"
  add_index "papeel_roles", ["user_id"], name: "index_papeel_roles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
