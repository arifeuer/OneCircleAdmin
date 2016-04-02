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

ActiveRecord::Schema.define(version: 20160402033759) do

  create_table "forms", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "stc_field_representative"
    t.string   "certification_number"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "location"
    t.string   "certified_date"
    t.string   "course_title"
    t.string   "total_participants"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "training_title"
    t.string "training_type"
    t.string "location"
    t.string "date"
    t.string "certification_number"
    t.string "course_start_date"
    t.string "course_end_date"
  end

end
