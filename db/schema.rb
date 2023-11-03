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

ActiveRecord::Schema[7.0].define(version: 2023_11_03_091835) do
  create_table "favorite_properties", force: :cascade do |t|
    t.integer "favorite_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_id"], name: "index_favorite_properties_on_favorite_id"
    t.index ["property_id"], name: "index_favorite_properties_on_property_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.integer "net_size"
    t.integer "rent"
    t.string "property_type"
    t.string "country"
    t.string "area"
    t.integer "number_of_living_rooms"
    t.integer "number_of_bathrooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type", default: "user"
    t.string "name"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_properties", "favorites"
  add_foreign_key "favorite_properties", "properties"
  add_foreign_key "favorites", "users"
end
