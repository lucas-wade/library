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

ActiveRecord::Schema.define(version: 20150708184334) do

  create_table "attachmentships", force: :cascade do |t|
    t.integer  "pub_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attachmentships", ["pub_id", "topic_id"], name: "index_attachmentships_on_pub_id_and_topic_id", unique: true
  add_index "attachmentships", ["pub_id"], name: "index_attachmentships_on_pub_id"
  add_index "attachmentships", ["topic_id"], name: "index_attachmentships_on_topic_id"

  create_table "families", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "families", ["kid_id"], name: "index_families_on_kid_id"
  add_index "families", ["parent_id", "kid_id"], name: "index_families_on_parent_id_and_kid_id", unique: true
  add_index "families", ["parent_id"], name: "index_families_on_parent_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "pub_translationships", force: :cascade do |t|
    t.integer  "translation_id"
    t.integer  "original_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pub_translationships", ["original_id"], name: "index_pub_translationships_on_original_id"
  add_index "pub_translationships", ["translation_id", "original_id"], name: "index_pub_translationships_on_translation_id_and_original_id", unique: true
  add_index "pub_translationships", ["translation_id"], name: "index_pub_translationships_on_translation_id"

  create_table "pubs", force: :cascade do |t|
    t.string   "language"
    t.boolean  "translated"
    t.string   "type"
    t.string   "url"
    t.string   "media"
    t.text     "meta_data",   limit: 4294967295
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
    t.integer  "language_id"
    t.boolean  "translation"
    t.integer  "pub_type"
    t.integer  "skill"
  end

  add_index "pubs", ["language"], name: "index_pubs_on_language"
  add_index "pubs", ["name"], name: "index_pubs_on_name", unique: true

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "topic_translationships", force: :cascade do |t|
    t.integer  "translation_id"
    t.integer  "original_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "topic_translationships", ["original_id"], name: "index_topic_translationships_on_original_id"
  add_index "topic_translationships", ["translation_id", "original_id"], name: "index_topic_translationships_on_translation_id_and_original_id", unique: true
  add_index "topic_translationships", ["translation_id"], name: "index_topic_translationships_on_translation_id"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "language"
    t.text     "main_content"
    t.integer  "skill",        default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "translation",  default: false
    t.integer  "category"
    t.string   "icon"
    t.boolean  "placeholder",  default: false
    t.boolean  "growing",      default: false
    t.integer  "version",      default: 0
  end

  add_index "topics", ["translation"], name: "index_topics_on_translation"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "last_login"
    t.string   "language",          default: "en"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["language"], name: "index_users_on_language"

end
