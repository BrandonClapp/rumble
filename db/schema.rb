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

ActiveRecord::Schema.define(version: 20150702235139) do

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "match_date"
    t.integer  "initiating_team_id"
    t.integer  "defending_team_id"
    t.integer  "tournament_id"
    t.string   "map_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_tournaments", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "tournament_id"
  end

  add_index "teams_tournaments", ["team_id"], name: "index_teams_tournaments_on_team_id"
  add_index "teams_tournaments", ["tournament_id"], name: "index_teams_tournaments_on_tournament_id"

  create_table "tournament_team_standings", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "team_id"
    t.integer  "points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tournament_team_standings", ["team_id"], name: "index_tournament_team_standings_on_team_id"
  add_index "tournament_team_standings", ["tournament_id"], name: "index_tournament_team_standings_on_tournament_id"

  create_table "tournaments", force: :cascade do |t|
    t.boolean  "enabled"
    t.string   "name"
    t.integer  "tournament_type", default: 0
    t.integer  "team_size"
    t.integer  "league_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tournaments", ["league_id"], name: "index_tournaments_on_league_id"

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
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
