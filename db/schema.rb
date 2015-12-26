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

ActiveRecord::Schema.define(version: 20151226063253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_vns", force: :cascade do |t|
    t.integer  "vn_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "character_vns", ["character_id"], name: "index_character_vns_on_character_id", using: :btree
  add_index "character_vns", ["vn_id"], name: "index_character_vns_on_vn_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "voiceactor"
    t.integer  "vn_id"
    t.string   "img_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characters", ["vn_id"], name: "index_characters_on_vn_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "detail"
    t.integer  "post_author_id"
    t.integer  "wall_author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "contest_characters", force: :cascade do |t|
    t.integer  "contest_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "image"
    t.text     "details"
  end

  create_table "contests", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
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
    t.integer  "vn_id"
  end

  add_index "posts", ["library_entry_id"], name: "index_posts_on_library_entry_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree
  add_index "posts", ["vn_id"], name: "index_posts_on_vn_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.integer  "vn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "publishers", ["vn_id"], name: "index_publishers_on_vn_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vn_id"
    t.text     "details"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree
  add_index "reviews", ["vn_id"], name: "index_reviews_on_vn_id", using: :btree

  create_table "screenshots", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "vn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "screenshots", ["vn_id"], name: "index_screenshots_on_vn_id", using: :btree

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
    t.text     "bio"
    t.integer  "role"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vn_chars", force: :cascade do |t|
    t.integer  "vn_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vn_chars", ["character_id"], name: "index_vn_chars_on_character_id", using: :btree
  add_index "vn_chars", ["vn_id"], name: "index_vn_chars_on_vn_id", using: :btree

  create_table "vn_genres", force: :cascade do |t|
    t.integer  "vn_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vn_genres", ["genre_id"], name: "index_vn_genres_on_genre_id", using: :btree
  add_index "vn_genres", ["vn_id"], name: "index_vn_genres_on_vn_id", using: :btree

  create_table "vn_publishers", force: :cascade do |t|
    t.integer  "vn_id"
    t.integer  "publisher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vn_publishers", ["publisher_id"], name: "index_vn_publishers_on_publisher_id", using: :btree
  add_index "vn_publishers", ["vn_id"], name: "index_vn_publishers_on_vn_id", using: :btree

  create_table "vns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "summary"
    t.string   "release_date"
    t.string   "image_poster"
    t.string   "image_coverpage"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.string   "image_4"
    t.boolean  "isFeatured"
    t.float    "rating_number"
    t.integer  "developer_id"
    t.string   "trailer_url"
    t.string   "slug"
    t.integer  "franchise_id"
    t.integer  "status",          default: 0
    t.string   "route_url"
    t.string   "buy_1"
    t.string   "buy_2"
    t.string   "buy_3"
    t.string   "buy_4"
    t.string   "alias"
  end

  add_index "vns", ["developer_id"], name: "index_vns_on_developer_id", using: :btree
  add_index "vns", ["franchise_id"], name: "index_vns_on_franchise_id", using: :btree

  add_foreign_key "character_vns", "characters"
  add_foreign_key "character_vns", "vns"
  add_foreign_key "library_entries", "users"
  add_foreign_key "library_entries", "vns"
  add_foreign_key "posts", "library_entries"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "vns"
  add_foreign_key "publishers", "vns"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "vns"
  add_foreign_key "screenshots", "vns"
  add_foreign_key "vn_chars", "characters"
  add_foreign_key "vn_chars", "vns"
  add_foreign_key "vn_genres", "genres"
  add_foreign_key "vn_genres", "vns"
  add_foreign_key "vn_publishers", "publishers"
  add_foreign_key "vn_publishers", "vns"
  add_foreign_key "vns", "developers"
  add_foreign_key "vns", "franchises"
end
