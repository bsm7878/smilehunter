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

ActiveRecord::Schema.define(version: 20180113145632) do

  create_table "comments", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "user_id"
    t.string   "comment_content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "platform_id"
    t.integer  "tv_type"
    t.string   "source_address"
    t.integer  "like_count"
    t.string   "tv_title"
    t.string   "tv_explanation"
    t.string   "tag_01"
    t.string   "tag_02"
    t.string   "tag_03"
    t.string   "tag_04"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "like_counts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mypages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nicknames", force: :cascade do |t|
    t.string   "full_nickname"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "platform"
    t.string   "channel_name"
    t.string   "image_src"
    t.string   "channel_address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "subcontents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
