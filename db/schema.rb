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

ActiveRecord::Schema.define(version: 20170315120659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gears", force: true do |t|
    t.string   "category",        null: false
    t.string   "name",            null: false
    t.integer  "year"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "gears", ["manufacturer_id"], name: "index_gears_on_manufacturer_id", using: :btree

  create_table "gears_players", id: false, force: true do |t|
    t.integer "player_id", null: false
    t.integer "gear_id",   null: false
  end

  add_index "gears_players", ["gear_id", "player_id"], name: "index_gears_players_on_gear_id_and_player_id", using: :btree
  add_index "gears_players", ["player_id", "gear_id"], name: "index_gears_players_on_player_id_and_gear_id", using: :btree

  create_table "manufacturers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.string   "dob"
    t.string   "number"
    t.string   "nationality"
    t.string   "position"
    t.string   "logo"
    t.string   "passport"
    t.integer  "age"
    t.boolean  "captain"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
