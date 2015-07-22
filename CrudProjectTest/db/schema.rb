# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", primary_key: "categoryId", force: :cascade do |t|
    t.string  "categoryTitle", limit: 45
    t.string  "categoryColor", limit: 45
    t.integer "userId",        limit: 4,  null: false
  end

  add_index "categories", ["userId"], name: "fk_Categories_Users1_idx", using: :btree

  create_table "comments", primary_key: "commentId", force: :cascade do |t|
    t.string   "description", limit: 45
    t.datetime "date"
    t.integer  "mediaId",     limit: 4
    t.integer  "recordId",    limit: 4
  end

  create_table "contributors", id: false, force: :cascade do |t|
    t.integer "userId",   limit: 4, null: false
    t.integer "recordId", limit: 4, null: false
  end

  add_index "contributors", ["recordId"], name: "fk_Users_has_Records_Records1_idx", using: :btree
  add_index "contributors", ["userId"], name: "fk_Users_has_Records_Users1_idx", using: :btree

  create_table "media", primary_key: "mediaId", force: :cascade do |t|
    t.string   "mediaPath",    limit: 45
    t.string   "mediaComment", limit: 45
    t.datetime "date"
  end

  create_table "media_has_comments", id: false, force: :cascade do |t|
    t.integer "commentId", limit: 4, null: false
    t.integer "mediaId",   limit: 4, null: false
  end

  add_index "media_has_comments", ["mediaId"], name: "fk_MediaComments_has_Media_Media1_idx", using: :btree

  create_table "records", primary_key: "recordId", force: :cascade do |t|
    t.string   "recordTitle",       limit: 45
    t.string   "recordDescription", limit: 45
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "endPresent"
    t.string   "recordPrivacity",   limit: 45
    t.integer  "userId",            limit: 4,  null: false
    t.string   "location",          limit: 45
    t.boolean  "isApproxStartDate", limit: 1
    t.boolean  "isApproxEndDate",   limit: 1
  end

  add_index "records", ["userId"], name: "userId_idx", using: :btree

  create_table "records_has_categories", id: false, force: :cascade do |t|
    t.integer "recordId",   limit: 4, null: false
    t.integer "categoryId", limit: 4, null: false
  end

  add_index "records_has_categories", ["categoryId"], name: "fk_Records_has_Categories_Categories1_idx", using: :btree
  add_index "records_has_categories", ["recordId"], name: "fk_Records_has_Categories_Records1_idx", using: :btree

  create_table "records_has_comments", id: false, force: :cascade do |t|
    t.integer "recordId",  limit: 4, null: false
    t.integer "commentId", limit: 4, null: false
  end

  add_index "records_has_comments", ["commentId"], name: "fk_Records_has_Comments_Comments1_idx", using: :btree
  add_index "records_has_comments", ["recordId"], name: "fk_Records_has_Comments_Records1_idx", using: :btree

  create_table "records_has_media", id: false, force: :cascade do |t|
    t.integer "recordId", limit: 4, null: false
    t.integer "mediaId",  limit: 4, null: false
  end

  add_index "records_has_media", ["mediaId"], name: "fk_Records_has_Media_Media1_idx", using: :btree
  add_index "records_has_media", ["recordId"], name: "fk_Records_has_Media_Records1_idx", using: :btree

  create_table "statistics", primary_key: "statisticId", force: :cascade do |t|
    t.datetime "date",   null: false
    t.datetime "logIn"
    t.datetime "logOut"
  end

  create_table "users", primary_key: "userId", force: :cascade do |t|
    t.string   "userName",         limit: 45, null: false
    t.string   "password",         limit: 45, null: false
    t.string   "firstName",        limit: 45, null: false
    t.string   "lastName",         limit: 45, null: false
    t.string   "email",            limit: 45, null: false
    t.string   "verificationCode", limit: 45
    t.string   "facebookAccount",  limit: 45
    t.string   "linkedInAccount",  limit: 45
    t.datetime "createDate"
  end

  add_foreign_key "categories", "users", column: "userId", primary_key: "userId", name: "fk_Categories_Users1"
  add_foreign_key "contributors", "records", column: "recordId", primary_key: "recordId", name: "fk_Users_has_Records_Records1"
  add_foreign_key "contributors", "users", column: "userId", primary_key: "userId", name: "fk_Users_has_Records_Users1"
  add_foreign_key "media_has_comments", "comments", column: "commentId", primary_key: "commentId", name: "commentId"
  add_foreign_key "media_has_comments", "media", column: "mediaId", primary_key: "mediaId", name: "fk_MediaComments_has_Media_Media1"
  add_foreign_key "records", "users", column: "userId", primary_key: "userId", name: "userId"
  add_foreign_key "records_has_categories", "categories", column: "categoryId", primary_key: "categoryId", name: "fk_Records_has_Categories_Categories1"
  add_foreign_key "records_has_categories", "records", column: "recordId", primary_key: "recordId", name: "fk_Records_has_Categories_Records1"
  add_foreign_key "records_has_comments", "comments", column: "commentId", primary_key: "commentId", name: "fk_Records_has_Comments_Comments1"
  add_foreign_key "records_has_comments", "records", column: "recordId", primary_key: "recordId", name: "fk_Records_has_Comments_Records1"
  add_foreign_key "records_has_media", "media", column: "mediaId", primary_key: "mediaId", name: "fk_Records_has_Media_Media1"
  add_foreign_key "records_has_media", "records", column: "recordId", primary_key: "recordId", name: "fk_Records_has_Media_Records1"
end
