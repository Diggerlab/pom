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

ActiveRecord::Schema.define(version: 20140311114926) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "dim_dates", force: true do |t|
    t.date    "full_date",              null: false
    t.integer "year_number",  limit: 2, null: false
    t.integer "month_number", limit: 2, null: false
    t.integer "day_number",   limit: 2, null: false
    t.integer "week_number",  limit: 2, null: false
  end

  create_table "dim_games", force: true do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "dim_income_sources", force: true do |t|
    t.integer "dim_game_id",            null: false
    t.string  "name",        limit: 50, null: false
  end

  create_table "dim_items", force: true do |t|
    t.integer "dim_game_id",            null: false
    t.string  "name",        limit: 50, null: false
    t.string  "code",        limit: 50, null: false
  end

  create_table "dim_users", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "remote_ip",  limit: 50
    t.string   "email",      limit: 50
    t.datetime "created_at",            null: false
  end

  create_table "fact_accounts", id: false, force: true do |t|
    t.integer "dim_game_id",               null: false
    t.integer "dim_date_id",               null: false
    t.integer "total_users",   default: 0
    t.integer "coins_balance", default: 0
    t.integer "gems_balance",  default: 0
    t.integer "gems_exchange", default: 0
    t.integer "coins_expense", default: 0
    t.integer "gems_expense",  default: 0
  end

  create_table "fact_active_users", id: false, force: true do |t|
    t.integer "dim_game_id",                                null: false
    t.integer "dim_date_id",                                null: false
    t.integer "today_users",                  default: 0
    t.integer "total_users",                  default: 0
    t.integer "today_logins",                 default: 0
    t.integer "one_days_retention",           default: 0
    t.integer "three_days_retention",         default: 0
    t.integer "seven_days_retention",         default: 0
    t.integer "fourteen_days_retention",      default: 0
    t.integer "thirty_days_retention",        default: 0
    t.integer "fb_connected_users",           default: 0
    t.float   "one_days_retention_rate",      default: 0.0
    t.float   "three_days_retention_rate",    default: 0.0
    t.float   "seven_days_retention_rate",    default: 0.0
    t.float   "fourteen_days_retention_rate", default: 0.0
    t.float   "thirty_days_retention_rate",   default: 0.0
  end

  create_table "fact_iap", id: false, force: true do |t|
    t.integer "dim_game_id",                        null: false
    t.integer "dim_date_id",                        null: false
    t.string  "product",     limit: 50
    t.integer "count",                  default: 0
  end

  create_table "fact_lotteries", id: false, force: true do |t|
    t.integer "dim_game_id",             null: false
    t.integer "dim_date_id",             null: false
    t.integer "dim_item_id",             null: false
    t.integer "total_count", default: 0
  end

  create_table "fact_pops", id: false, force: true do |t|
    t.integer "dim_game_id",             null: false
    t.integer "dim_date_id",             null: false
    t.integer "matches",     default: 0
    t.integer "points",      default: 0
    t.integer "coins",       default: 0
  end

  create_table "fact_purchases", id: false, force: true do |t|
    t.integer "dim_game_id",                        null: false
    t.integer "dim_date_id",                        null: false
    t.string  "item",        limit: 50
    t.integer "total_count",            default: 0
    t.integer "total_coins",            default: 0
    t.integer "total_gems",             default: 0
  end

  create_table "fact_racings", id: false, force: true do |t|
    t.integer "dim_game_id",                  null: false
    t.integer "dim_date_id",                  null: false
    t.integer "new_matches",      default: 0
    t.integer "pending_matches",  default: 0
    t.integer "finished_matches", default: 0
    t.integer "players",          default: 0
    t.integer "init_wins",        default: 0
    t.integer "total_awards",     default: 0
    t.integer "init_awards",      default: 0
  end

  create_table "fact_revenues", id: false, force: true do |t|
    t.integer "dim_game_id",                null: false
    t.integer "dim_date_id",                null: false
    t.integer "paid_users",   default: 0
    t.integer "iap_users",    default: 0
    t.float   "iap_revenues", default: 0.0
    t.float   "month_arpu",   default: 0.0
    t.float   "month_arppu",  default: 0.0
  end

  create_table "fact_user_incomes", id: false, force: true do |t|
    t.integer "dim_game_id",                      null: false
    t.integer "dim_income_source_id",             null: false
    t.integer "dim_date_id",                      null: false
    t.integer "total_coins",          default: 0
    t.integer "total_gems",           default: 0
  end

end
