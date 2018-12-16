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

ActiveRecord::Schema.define(version: 2018_12_16_120609) do

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "phonenumber"
    t.string "email"
    t.integer "expectedsalary"
    t.string "linkedin"
    t.string "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "currency"
    t.integer "vacancy_id"
    t.string "skype"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetrooms", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberparams", force: :cascade do |t|
    t.integer "member_id"
    t.text "position"
    t.string "email"
    t.string "skype"
    t.string "phonenumber"
    t.string "emergencyname"
    t.string "emergencyphonenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "passwordconfirmation"
    t.string "promocode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "meetroom_id"
    t.string "userName"
    t.date "dateBoth"
    t.time "timeStart"
    t.time "timeEnd"
    t.datetime "timeDateStart"
    t.datetime "timeDateEnd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "experience"
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
