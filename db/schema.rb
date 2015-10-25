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

ActiveRecord::Schema.define(version: 20151025100218) do

  create_table "Vns", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.string   "developer"
    t.string   "rating"
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
  end

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

  add_index "characters", ["vn_id"], name: "index_characters_on_vn_id"

end
