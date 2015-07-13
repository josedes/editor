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

ActiveRecord::Schema.define(version: 20150527134310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frascos", force: :cascade do |t|
    t.text     "frasco1"
    t.text     "frasco2"
    t.text     "frasco3"
    t.text     "frasco4"
    t.text     "frasco5"
    t.text     "frasco6"
    t.text     "frasco7"
    t.text     "frasco8"
    t.text     "frasco9"
    t.text     "frasco10"
    t.text     "frasco11"
    t.text     "frasco12"
    t.text     "frasco13"
    t.text     "frasco14"
    t.text     "frasco15"
    t.text     "frasco16"
    t.text     "frasco17"
    t.text     "frasco18"
    t.text     "frasco19"
    t.text     "frasco20"
    t.text     "frasco21"
    t.text     "frasco22"
    t.text     "frasco23"
    t.text     "frasco24"
    t.text     "frasco25"
    t.text     "frasco26"
    t.text     "frasco27"
    t.text     "frasco28"
    t.text     "frasco29"
    t.text     "frasco30"
    t.text     "frasco31"
    t.text     "frasco32"
    t.text     "frasco33"
    t.text     "frasco34"
    t.text     "frasco35"
    t.text     "frasco36"
    t.text     "frasco37"
    t.text     "frasco38"
    t.text     "frasco39"
    t.text     "frasco40"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mensajes", force: :cascade do |t|
    t.string   "nombre"
    t.text     "mensaje"
    t.text     "respuesta"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu0s", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "estado"
    t.integer  "posicion"
    t.string   "enlace"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "titulo_contenido"
    t.text     "contenido"
  end

  create_table "menu1s", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "estado"
    t.integer  "posicion"
    t.string   "enlace"
    t.integer  "menu0_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "titulo_contenido"
    t.text     "contenido"
  end

  add_index "menu1s", ["menu0_id"], name: "index_menu1s_on_menu0_id", using: :btree

  create_table "menu2s", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "estado"
    t.integer  "posicion"
    t.string   "enlace"
    t.integer  "menu1_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "titulo_contenido"
    t.text     "contenido"
  end

  add_index "menu2s", ["menu1_id"], name: "index_menu2s_on_menu1_id", using: :btree

  create_table "pagos", force: :cascade do |t|
    t.date     "fechaPago"
    t.integer  "tipoPago"
    t.string   "numero"
    t.string   "banco"
    t.decimal  "monto"
    t.integer  "usuarios_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cedula"
    t.string   "numeroExcel"
    t.string   "historia"
    t.string   "telefonoHabitacion"
    t.string   "telefonoTrabajo"
    t.string   "celular1"
    t.string   "celular2"
    t.date     "fechaNacimiento"
    t.string   "email2"
    t.integer  "estado"
    t.integer  "ava"
    t.integer  "cuc"
    t.integer  "hong"
    t.integer  "berm"
    t.integer  "john"
    t.integer  "asp"
    t.integer  "blom"
    t.integer  "rol"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  add_index "usuarios", ["username"], name: "index_usuarios_on_username", unique: true, using: :btree

  add_foreign_key "menu1s", "menu0s"
  add_foreign_key "menu2s", "menu1s"
end
