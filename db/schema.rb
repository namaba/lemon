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

ActiveRecord::Schema.define(version: 20181204064519) do

  create_table "announcements", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "user_profile_id", limit: 4
    t.text     "body",            limit: 65535
    t.integer  "status",          limit: 4,     default: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "deleted_at"
  end

  add_index "announcements", ["deleted_at"], name: "index_announcements_on_deleted_at", using: :btree
  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree
  add_index "announcements", ["user_profile_id"], name: "index_announcements_on_user_profile_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name",         limit: 255,                   null: false
    t.integer  "user_id",      limit: 4
    t.string   "category",     limit: 255
    t.text     "introduce",    limit: 65535
    t.string   "image",        limit: 255
    t.integer  "status",       limit: 4,     default: 1
    t.boolean  "invitational",               default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.datetime "deleted_at"
  end

  add_index "communities", ["deleted_at"], name: "index_communities_on_deleted_at", using: :btree
  add_index "communities", ["user_id"], name: "index_communities_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "target_id",  limit: 4,             null: false
    t.integer  "like",       limit: 4, default: 0
    t.integer  "is_liked",   limit: 4, default: 0
    t.integer  "status",     limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "deleted_at"
  end

  add_index "likes", ["deleted_at"], name: "index_likes_on_deleted_at", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "partnership_id", limit: 4,                 null: false
    t.integer  "sender_id",      limit: 4,                 null: false
    t.text     "body",           limit: 65535
    t.string   "image",          limit: 255
    t.integer  "read",           limit: 4,     default: 1, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.datetime "deleted_at"
  end

  create_table "murmur_comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "murmur_id",  limit: 4
    t.string   "comment",    limit: 255
    t.integer  "status",     limit: 4,   default: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "deleted_at"
  end

  add_index "murmur_comments", ["deleted_at"], name: "index_murmur_comments_on_deleted_at", using: :btree
  add_index "murmur_comments", ["murmur_id"], name: "index_murmur_comments_on_murmur_id", using: :btree
  add_index "murmur_comments", ["user_id"], name: "index_murmur_comments_on_user_id", using: :btree

  create_table "murmur_smiles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "murmur_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "deleted_at"
  end

  add_index "murmur_smiles", ["murmur_id"], name: "index_murmur_smiles_on_murmur_id", using: :btree
  add_index "murmur_smiles", ["user_id"], name: "index_murmur_smiles_on_user_id", using: :btree

  create_table "murmurs", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.text     "body",          limit: 255
    t.string   "image",         limit: 255
    t.boolean  "comment_badge",             default: false
    t.integer  "status",        limit: 4,   default: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "deleted_at"
  end

  add_index "murmurs", ["deleted_at"], name: "index_murmurs_on_deleted_at", using: :btree
  add_index "murmurs", ["user_id"], name: "index_murmurs_on_user_id", using: :btree

  create_table "partnerships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "target_id",  limit: 4,             null: false
    t.integer  "status",     limit: 4, default: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "deleted_at"
  end

  add_index "partnerships", ["deleted_at"], name: "index_partnerships_on_deleted_at", using: :btree
  add_index "partnerships", ["user_id"], name: "index_partnerships_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "user_name",   limit: 255
    t.integer  "target_id",   limit: 4
    t.string   "target_name", limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
  end

  add_index "reports", ["deleted_at"], name: "index_reports_on_deleted_at", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "topic_chats", force: :cascade do |t|
    t.integer  "community_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "topic_id",     limit: 4
    t.string   "body",         limit: 255
    t.string   "image",        limit: 255
    t.integer  "status",       limit: 4,   default: 1
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "deleted_at"
  end

  add_index "topic_chats", ["community_id"], name: "index_topic_chats_on_community_id", using: :btree
  add_index "topic_chats", ["deleted_at"], name: "index_topic_chats_on_deleted_at", using: :btree
  add_index "topic_chats", ["topic_id"], name: "index_topic_chats_on_topic_id", using: :btree
  add_index "topic_chats", ["user_id"], name: "index_topic_chats_on_user_id", using: :btree

  create_table "topic_smiles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "topic_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "deleted_at"
  end

  add_index "topic_smiles", ["topic_id"], name: "index_topic_smiles_on_topic_id", using: :btree
  add_index "topic_smiles", ["user_id"], name: "index_topic_smiles_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.integer  "community_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255,               null: false
    t.text     "body",         limit: 65535
    t.integer  "status",       limit: 4,     default: 1
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
  end

  add_index "topics", ["community_id"], name: "index_topics_on_community_id", using: :btree
  add_index "topics", ["deleted_at"], name: "index_topics_on_deleted_at", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "user_communities", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "community_id", limit: 4
    t.boolean  "is_orner",               default: false
    t.boolean  "is_banned",              default: false
    t.boolean  "is_approved",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
  end

  add_index "user_communities", ["community_id"], name: "index_user_communities_on_community_id", using: :btree
  add_index "user_communities", ["deleted_at"], name: "index_user_communities_on_deleted_at", using: :btree
  add_index "user_communities", ["user_id"], name: "index_user_communities_on_user_id", using: :btree

  create_table "user_partnerships", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "partnership_id", limit: 4
    t.integer  "status",         limit: 4, default: 1
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "deleted_at"
  end

  add_index "user_partnerships", ["deleted_at"], name: "index_user_partnerships_on_deleted_at", using: :btree
  add_index "user_partnerships", ["partnership_id"], name: "index_user_partnerships_on_partnership_id", using: :btree
  add_index "user_partnerships", ["user_id"], name: "index_user_partnerships_on_user_id", using: :btree

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "sex",                  limit: 4,     default: 0
    t.integer  "play_style",           limit: 4
    t.date     "birthday"
    t.integer  "address",              limit: 4,     default: 13
    t.integer  "plan",                 limit: 4
    t.text     "introduce",            limit: 65535
    t.string   "image1",               limit: 255
    t.string   "image2",               limit: 255
    t.string   "image3",               limit: 255
    t.integer  "height",               limit: 4
    t.integer  "style",                limit: 4
    t.integer  "job",                  limit: 4
    t.integer  "income",               limit: 4
    t.text     "hobby",                limit: 65535
    t.integer  "housemate",            limit: 4
    t.integer  "alcohol",              limit: 4
    t.integer  "smoke",                limit: 4
    t.integer  "purpose",              limit: 4
    t.integer  "marriage",             limit: 4
    t.integer  "child",                limit: 4
    t.text     "personality",          limit: 65535
    t.integer  "holiday",              limit: 4
    t.integer  "to_meet",              limit: 4
    t.integer  "blood_type",           limit: 4
    t.integer  "school",               limit: 4
    t.integer  "bro_sis",              limit: 4
    t.integer  "identification",       limit: 4,     default: 1
    t.string   "identification_image", limit: 255
    t.integer  "answer_rate",          limit: 4,     default: 0
    t.integer  "good_count",           limit: 4,     default: 20
    t.integer  "coins_count",          limit: 4,     default: 20
    t.integer  "mail_status",          limit: 4,     default: 1
    t.integer  "tutorial_status",      limit: 4,     default: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "user_statuses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "good_count", limit: 4, default: 0, null: false
    t.integer  "free_coin",  limit: 4, default: 0, null: false
    t.integer  "pay_coin",   limit: 4, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "user_statuses", ["user_id"], name: "index_user_statuses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "image",                  limit: 255
    t.string   "name",                   limit: 255
    t.datetime "deleted_at"
    t.boolean  "admin_flg",                          default: false, null: false
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "announcements", "user_profiles"
  add_foreign_key "announcements", "users"
  add_foreign_key "communities", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "murmur_comments", "murmurs"
  add_foreign_key "murmur_comments", "users"
  add_foreign_key "murmur_smiles", "murmurs"
  add_foreign_key "murmur_smiles", "users"
  add_foreign_key "murmurs", "users"
  add_foreign_key "partnerships", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "topic_chats", "communities"
  add_foreign_key "topic_chats", "topics"
  add_foreign_key "topic_chats", "users"
  add_foreign_key "topic_smiles", "topics"
  add_foreign_key "topic_smiles", "users"
  add_foreign_key "topics", "communities"
  add_foreign_key "topics", "users"
  add_foreign_key "user_communities", "communities"
  add_foreign_key "user_communities", "users"
  add_foreign_key "user_partnerships", "partnerships"
  add_foreign_key "user_partnerships", "users"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "user_statuses", "users"
end
