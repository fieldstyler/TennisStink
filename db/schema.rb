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

ActiveRecord::Schema.define(version: 2021_02_19_164832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string "type"
    t.string "score"
    t.string "result"
    t.string "date"
    t.string "surface"
    t.string "notes"
    t.bigint "player_id"
    t.string "partner"
    t.string "opponent"
    t.string "opponent2"
    t.index ["player_id"], name: "index_matches_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "ranking"
    t.string "location"
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "matches", "players"
end
