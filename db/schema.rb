# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_20_234844) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "info"
    t.string "image"
    t.datetime "release_date"
    t.integer "band_id"
    t.integer "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["band_id"], name: "index_albums_on_band_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "info"
    t.datetime "birth"
    t.datetime "death"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "info"
    t.string "founded"
    t.string "disbanded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "band_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_members_on_artist_id"
    t.index ["band_id"], name: "index_members_on_band_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "info"
    t.integer "length"
    t.integer "position"
    t.integer "album_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "bands"
  add_foreign_key "members", "artists"
  add_foreign_key "members", "bands"
  add_foreign_key "songs", "albums"
end
