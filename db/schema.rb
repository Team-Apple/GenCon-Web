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

ActiveRecord::Schema.define(version: 20171103184831) do

  create_table "announcements", force: :cascade do |t|
    t.date "date"
    t.boolean "timing", default: true
    t.integer "mode", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "memo"
    t.date "end_at_date"
    t.date "start_at_date"
    t.integer "priority", default: 1
    t.time "start_at_time"
    t.time "end_at_time"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.date "start_from_date"
    t.date "deadline_date"
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1
    t.time "start_from_time"
    t.time "deadline_time"
  end

end
