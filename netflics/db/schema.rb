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

ActiveRecord::Schema.define(version: 20170418020251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.integer  "series_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_actors_on_series_id", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.integer  "series_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_directors_on_series_id", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "length"
    t.text     "summary"
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id", using: :btree
  end

  create_table "parent_children", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "number"
    t.integer  "year"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_seasons_on_series_id", using: :btree
  end

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.integer  "genre"
    t.integer  "country"
    t.integer  "language"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series_actors", id: false, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "series_id"
  end

  create_table "series_directors", id: false, force: :cascade do |t|
    t.integer "director_id"
    t.integer "series_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "actors", "series"
  add_foreign_key "directors", "series"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "seasons", "series"
end
