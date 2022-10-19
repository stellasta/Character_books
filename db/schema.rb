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

ActiveRecord::Schema[7.0].define(version: 2022_09_23_125920) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
    t.string "sex"
    t.string "race"
    t.string "hair"
    t.string "eye"
    t.string "skin"
    t.string "form"
    t.string "dress"
    t.text "special"
    t.string "personality1"
    t.text "personality2"
    t.string "personality3"
    t.text "personality4"
    t.string "personality5"
    t.text "personality6"
    t.text "others1"
    t.text "others2"
    t.text "others3"
    t.string "age"
    t.string "height"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
