# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20181009235906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description"
    t.string   "picture"
    t.string   "slug",                     null: false
    t.datetime "last_visit"
    t.integer  "max_notes"
    t.string   "sources_notes_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_noisu.boards_on_slug", using: :btree
  end

  create_table "boards_sources", force: :cascade do |t|
    t.integer  "board_id",   null: false
    t.integer  "source_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["board_id"], name: "index_noisu.boards_sources_on_board_id", using: :btree
    t.index ["source_id"], name: "index_noisu.boards_sources_on_source_id", using: :btree
  end

  create_table "boards_stats", force: :cascade do |t|
    t.integer  "board_id",               null: false
    t.integer  "num_notes",  default: 0, null: false
    t.integer  "avg_notes",  default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["board_id"], name: "index_noisu.boards_stats_on_board_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_slugs_slug_sluggable_type_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_slugs_slug_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_slugs_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_slugs_sluggable_type", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_noisu.notes_on_user_id", using: :btree
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "source_attrs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources_notes", force: :cascade do |t|
    t.integer  "board_id",   null: false
    t.integer  "source_id",  null: false
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["board_id"], name: "index_noisu.sources_notes_on_board_id", using: :btree
    t.index ["source_id"], name: "index_noisu.sources_notes_on_source_id", using: :btree
    t.index ["user_id"], name: "index_noisu.sources_notes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",      null: false
    t.string   "pass",       null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
