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

ActiveRecord::Schema.define(version: 20180410105433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "irregular_offs", force: :cascade, comment: "急な休み" do |t|
    t.integer "staff_id", null: false, comment: "スタッフID"
    t.datetime "date", null: false, comment: "日付"
    t.string "start", null: false, comment: "開始時間"
    t.string "end", null: false, comment: "終了時間"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operators", force: :cascade, comment: "オペレーター" do |t|
    t.boolean "is_admin", default: false, null: false, comment: "管理者権限"
    t.string "name", null: false, comment: "名前"
    t.string "email", null: false, comment: "メール"
    t.string "phone", null: false, comment: "電話番号"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_operators_on_email", unique: true
    t.index ["name"], name: "index_operators_on_name", unique: true
  end

  create_table "regular_shifts", force: :cascade, comment: "通常時のシフト" do |t|
    t.integer "staff_id", null: false, comment: "スタッフID"
    t.string "mon_start", null: false, comment: "月曜日開始"
    t.string "mon_end", null: false, comment: "月曜日終了"
    t.string "tue_start", null: false, comment: "火曜日開始"
    t.string "tue_end", null: false, comment: "火曜日終了"
    t.string "wed_start", null: false, comment: "水曜日開始"
    t.string "wed_end", null: false, comment: "水曜日終了"
    t.string "thu_start", null: false, comment: "木曜日開始"
    t.string "thu_end", null: false, comment: "木曜日終了"
    t.string "fri_start", null: false, comment: "金曜日開始"
    t.string "fri_end", null: false, comment: "金曜日終了"
    t.string "sat_start", null: false, comment: "土曜日開始"
    t.string "sat_end", null: false, comment: "土曜日終了"
    t.string "sun_start", null: false, comment: "日曜日開始"
    t.string "sun_end", null: false, comment: "日曜日終了"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade, comment: "家事代行スタッフ" do |t|
    t.integer "gender_id", null: false, comment: "性別(gender.yml参照)"
    t.integer "age", null: false, comment: "年齢"
    t.string "name", null: false, comment: "名前"
    t.datetime "birthday", comment: "誕生日"
    t.string "email", null: false, comment: "メール"
    t.string "phone", null: false, comment: "電話番号"
    t.string "zip", comment: "郵便番号"
    t.string "state", comment: "都道府県"
    t.string "city", comment: "市区町村"
    t.string "street", comment: "番地"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["name"], name: "index_staffs_on_name", unique: true
  end

  create_table "users", force: :cascade, comment: "ユーザー" do |t|
    t.integer "gender_id", null: false, comment: "性別(gender.yml参照)"
    t.integer "age", null: false, comment: "年齢"
    t.string "avatar", comment: "プロファイル画像"
    t.string "name", null: false, comment: "名前"
    t.datetime "birthday", comment: "誕生日"
    t.string "email", null: false, comment: "メール"
    t.string "phone", null: false, comment: "電話番号"
    t.string "zip", comment: "郵便番号"
    t.string "state", comment: "都道府県"
    t.string "city", comment: "市区町村"
    t.string "street", comment: "番地"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "irregular_offs", "staffs", name: "irregular_offs_staff_id_fk"
  add_foreign_key "regular_shifts", "staffs", name: "regular_shifts_staff_id_fk"
end
