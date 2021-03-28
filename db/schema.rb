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

ActiveRecord::Schema.define(version: 2021_03_28_091201) do

  create_table "users", force: :cascade do |t|
    t.string "email_address", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "auth_token", default: "", null: false
    t.integer "web_links_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "web_links", force: :cascade do |t|
    t.string "uid", default: "", null: false
    t.string "original_url", default: "", null: false
    t.string "title"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_web_links_on_uid", unique: true
    t.index ["user_id"], name: "index_web_links_on_user_id"
  end

  add_foreign_key "web_links", "users"
end
