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

ActiveRecord::Schema.define(version: 20170301053407) do

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "sex",                  limit: 4
    t.integer  "play_style",           limit: 4
    t.date     "birthday"
    t.integer  "address",              limit: 4
    t.integer  "plan",                 limit: 4
    t.text     "introduce",            limit: 65535
    t.string   "image1",               limit: 255
    t.string   "image2",               limit: 255
    t.string   "image3",               limit: 255
    t.integer  "height",               limit: 4
    t.string   "style",                limit: 255
    t.string   "job",                  limit: 255
    t.string   "income",               limit: 255
    t.string   "hobby",                limit: 255
    t.string   "housemate",            limit: 255
    t.integer  "alcohol",              limit: 4
    t.integer  "smoke",                limit: 4
    t.integer  "purpose",              limit: 4
    t.integer  "marriage",             limit: 4
    t.integer  "child",                limit: 4
    t.integer  "identification",       limit: 4,     default: 1
    t.string   "identification_image", limit: 255
    t.integer  "good_count",           limit: 4,     default: 20
    t.integer  "coins_count",          limit: 4,     default: 20
    t.integer  "mail_status",          limit: 4,     default: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "image",                  limit: 255
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "user_profiles", "users"
end
