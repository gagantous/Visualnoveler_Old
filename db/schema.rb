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

ActiveRecord::Schema.define(version: 20160309093421) do

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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0
  end

  add_index "characters", ["vn_id"], name: "index_characters_on_vn_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "detail"
    t.integer  "post_author_id"
    t.integer  "wall_author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.boolean  "favourite"
    t.text     "notes"
  end

  add_index "library_entries", ["user_id"], name: "index_library_entries_on_user_id", using: :btree
  add_index "library_entries", ["vn_id"], name: "index_library_entries_on_vn_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
    t.string   "featured_image"
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id", using: :btree

  create_table "news_images", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "news_id"
  end

  add_index "news_images", ["news_id"], name: "index_news_images_on_news_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

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

  create_table "starburst_announcement_views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "announcement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "starburst_announcement_views", ["user_id", "announcement_id"], name: "starburst_announcement_view_index", unique: true, using: :btree

  create_table "starburst_announcements", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "start_delivering_at"
    t.datetime "stop_delivering_at"
    t.text     "limit_to_users"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "category"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.string  "slug"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["slug"], name: "index_tags_on_slug", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "library_image"
    t.string   "library_image_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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
    t.integer  "status",              default: 0
    t.string   "buy_1"
    t.string   "buy_2"
    t.string   "buy_3"
    t.string   "buy_4"
    t.string   "alias"
    t.text     "walkthrough_content"
  end

  add_index "vns", ["developer_id"], name: "index_vns_on_developer_id", using: :btree
  add_index "vns", ["franchise_id"], name: "index_vns_on_franchise_id", using: :btree

  add_foreign_key "character_vns", "characters"
  add_foreign_key "character_vns", "vns"
  add_foreign_key "library_entries", "users"
  add_foreign_key "library_entries", "vns"
  add_foreign_key "news", "users"
  add_foreign_key "news_images", "news"
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
