# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_01_151209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "like_seconds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "palette_second_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["palette_second_id"], name: "index_like_seconds_on_palette_second_id"
    t.index ["user_id", "palette_second_id"], name: "index_like_seconds_on_user_id_and_palette_second_id", unique: true
    t.index ["user_id"], name: "index_like_seconds_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "palette_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["palette_id"], name: "index_likes_on_palette_id"
    t.index ["user_id", "palette_id"], name: "index_likes_on_user_id_and_palette_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "palette_second_tags", force: :cascade do |t|
    t.bigint "palette_second_id", null: false
    t.bigint "tag_second_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["palette_second_id"], name: "index_palette_second_tags_on_palette_second_id"
    t.index ["tag_second_id"], name: "index_palette_second_tags_on_tag_second_id"
  end

  create_table "palette_seconds", force: :cascade do |t|
    t.string "main", null: false
    t.string "sub", null: false
    t.string "body", null: false
    t.string "bg", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_palette_seconds_on_user_id"
  end

  create_table "palette_tags", force: :cascade do |t|
    t.bigint "palette_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["palette_id", "tag_id"], name: "index_palette_tags_on_palette_id_and_tag_id", unique: true
    t.index ["palette_id"], name: "index_palette_tags_on_palette_id"
    t.index ["tag_id"], name: "index_palette_tags_on_tag_id"
  end

  create_table "palettes", force: :cascade do |t|
    t.string "main", null: false
    t.string "sub", null: false
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "bgimage", default: 0, null: false
    t.index ["user_id"], name: "index_palettes_on_user_id"
  end

  create_table "tag_seconds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", default: 0, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "like_seconds", "palette_seconds"
  add_foreign_key "like_seconds", "users"
  add_foreign_key "likes", "palettes"
  add_foreign_key "likes", "users"
  add_foreign_key "palette_second_tags", "palette_seconds"
  add_foreign_key "palette_second_tags", "tag_seconds"
  add_foreign_key "palette_seconds", "users"
  add_foreign_key "palette_tags", "palettes"
  add_foreign_key "palette_tags", "tags"
  add_foreign_key "palettes", "users"
end
