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

ActiveRecord::Schema.define(version: 20160228015512) do

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
    t.string   "collection"
    t.string   "bio"
    t.string   "hobby"
    t.string   "fanfou"
    t.string   "weibo"
    t.string   "twitter"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["name"], name: "index_members_on_name", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "nodes", force: :cascade do |t|
    t.string   "slogan"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "parent_slogan"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "topic_id"
    t.integer  "reply_id"
    t.integer  "sender_id"
    t.boolean  "unread"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "topic_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "floor"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "member_id"
    t.integer  "node_id"
    t.integer  "click"
    t.datetime "last_modified"
  end

end
