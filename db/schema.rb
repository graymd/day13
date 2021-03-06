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

ActiveRecord::Schema.define(version: 20150126195409) do

  create_table "clinics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "st_address", limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.text     "doctor_name",     limit: 65535
    t.integer  "doctorable_id",   limit: 4
    t.string   "doctorable_type", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "company",           limit: 255
    t.string   "adverse_reactions", limit: 255
    t.boolean  "generic_option",    limit: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "patient_id",        limit: 4
  end

  create_table "patient_medications", force: :cascade do |t|
    t.integer  "patient_id",    limit: 4
    t.integer  "medication_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.date     "date_of_birth"
    t.text     "description",   limit: 65535
    t.string   "gender",        limit: 255
    t.string   "blood_type",    limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "clinic_id",     limit: 4
  end

end
