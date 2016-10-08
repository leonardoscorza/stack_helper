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

ActiveRecord::Schema.define(version: 20161008221741) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "text"
    t.integer  "answer_father_id"
    t.boolean  "user_mark_as_right"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags_questions", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "hashtag_id"
    t.index ["hashtag_id"], name: "index_hashtags_questions_on_hashtag_id"
    t.index ["question_id"], name: "index_hashtags_questions_on_question_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "likable_id"
    t.integer  "likable_type"
    t.boolean  "kind"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "hashtag_id"
    t.integer  "user_id"
    t.integer  "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tag_body"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "name"
    t.string   "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
