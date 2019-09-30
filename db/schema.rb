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

ActiveRecord::Schema.define(version: 2019_09_30_130712) do

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
    t.boolean "deleted", default: false, comment: "是否删除"
    t.index ["book_id", "user_id"], name: "index_reading_records_on_book_id_and_user_id", unique: true
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

  create_table "verifications", force: :cascade do |t|
    t.string "digest", null: false, comment: "验证码"
    t.string "source", null: false, comment: "手机号/邮箱"
    t.datetime "expired_at", comment: "失效时间"
    t.integer "available_times", comment: "可使用次数"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
