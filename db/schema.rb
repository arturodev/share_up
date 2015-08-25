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

ActiveRecord::Schema.define(version: 20150729040725) do

  create_table "accesos", force: :cascade do |t|
    t.integer  "esquema_id", limit: 4
    t.string   "user",       limit: 255
    t.string   "password",   limit: 255
    t.decimal  "tipo",                   precision: 10
    t.string   "comentario", limit: 255
    t.boolean  "is_active",  limit: 1,                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accesos", ["esquema_id"], name: "index_accesos_on_esquema_id", using: :btree

  create_table "aplicacions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "databases", force: :cascade do |t|
    t.integer  "servidor_id", limit: 4
    t.string   "nombre",      limit: 255
    t.string   "sid",         limit: 255
    t.string   "cadena",      limit: 255
    t.decimal  "puerto_db",               precision: 10
    t.boolean  "is_active",   limit: 1,                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "databases", ["servidor_id"], name: "index_databases_on_servidor_id", using: :btree

  create_table "esquemas", force: :cascade do |t|
    t.integer  "database_id", limit: 4
    t.string   "nombre",      limit: 255
    t.string   "user",        limit: 255
    t.string   "password",    limit: 255
    t.string   "tipo",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "esquemas", ["database_id"], name: "index_esquemas_on_database_id", using: :btree

  create_table "servidors", force: :cascade do |t|
    t.string   "hostname",   limit: 255
    t.string   "ip",         limit: 255
    t.string   "puerto",     limit: 255
    t.string   "usuario",    limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sisoperativos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "nombre2",    limit: 255
    t.string   "tipo",       limit: 255
    t.string   "permisos",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
