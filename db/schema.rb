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

ActiveRecord::Schema.define(version: 20151112072957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "voiceactor"
    t.integer  "vn_id"
    t.string   "vn_name"
    t.string   "img_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characters", ["vn_id"], name: "index_characters_on_vn_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_entries", force: :cascade do |t|
    t.integer  "rating"
    t.string   "status"
    t.integer  "vn_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.boolean  "favourite"
  end

  add_index "library_entries", ["user_id"], name: "index_library_entries_on_user_id", using: :btree
  add_index "library_entries", ["vn_id"], name: "index_library_entries_on_vn_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "detail"
    t.integer  "library_entry_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "posts", ["library_entry_id"], name: "index_posts_on_library_entry_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "poster_image"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vn_genres", force: :cascade do |t|
    t.integer  "vn_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vn_genres", ["genre_id"], name: "index_vn_genres_on_genre_id", using: :btree
  add_index "vn_genres", ["vn_id"], name: "index_vn_genres_on_vn_id", using: :btree

  create_table "vns", force: :cascade do |t|
    t.string   "name"
    t.string   "genre_old"
    t.string   "developer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "summary"
    t.string   "release_date"
    t.string   "image_poster"
    t.string   "image_coverpage"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.string   "image_4"
    t.boolean  "isFeatured"
    t.integer  "genre_id"
    t.float    "rating_number"
  end

  add_index "vns", ["genre_id"], name: "index_vns_on_genre_id", using: :btree

  add_foreign_key "library_entries", "users"
  add_foreign_key "library_entries", "vns"
  add_foreign_key "posts", "library_entries"
  add_foreign_key "posts", "users"
  add_foreign_key "vn_genres", "genres"
  add_foreign_key "vn_genres", "vns"
  add_foreign_key "vns", "genres"
end
