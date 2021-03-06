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

ActiveRecord::Schema.define(version: 20151116234943) do

  create_table "activities", force: true do |t|
    t.string   "source"
    t.string   "type"
    t.datetime "start_time"
    t.integer  "utc_offset"
    t.decimal  "total_distance"
    t.decimal  "duration"
    t.integer  "average_heart_rate"
    t.decimal  "total_calories"
    t.decimal  "climb"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "food_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "recipes_id"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_items", ["recipes_id"], name: "index_food_items_on_recipes_id"
  add_index "food_items", ["users_id"], name: "index_food_items_on_users_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "decription"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.decimal  "weight"
    t.decimal  "weight_loss_rate"
    t.decimal  "goal_weight"
    t.string   "runkeeper_id"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
