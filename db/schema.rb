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

ActiveRecord::Schema.define(version: 2019_06_05_143859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.integer "ywid", null: false, comment: "起点中文网书 id"
    t.string "name", null: false, comment: "书名"
    t.string "author_name", null: false, comment: "作者名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "book_id", null: false, comment: "所属书 id"
    t.integer "ywid", null: false, comment: "章节起点中文网 id"
    t.string "name", comment: "章节名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_records", force: :cascade do |t|
    t.integer "book_id", null: false, comment: "书 id"
    t.integer "user_id", null: false, comment: "用户 id"
    t.integer "latest_chapter_id", comment: "最近阅读章节 id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "user_id"], name: "index_reading_records_on_book_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false, comment: "用户名"
    t.string "nick_name", comment: "用户昵称"
    t.string "mobile", comment: "手机号"
    t.string "email", comment: "邮箱"
    t.string "password_digest", comment: "密码摘要"
    t.string "remember_digest", comment: "记住用户登录摘要"
    t.boolean "admin", default: false, comment: "是否为管理员"
    t.string "activation_digest", comment: "邮箱激活摘要"
    t.boolean "activated", default: false, comment: "邮箱是否已激活"
    t.datetime "activated_at", comment: "激活时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["mobile"], name: "index_users_on_mobile"
    t.index ["name"], name: "index_users_on_name"
  end

end
