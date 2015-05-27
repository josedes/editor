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

ActiveRecord::Schema.define(version: 20150526221452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contenidos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frascos", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fechaElaboracion"
    t.date     "fechaRetiro"
    t.string   "estado"
    t.integer  "usuario_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "mensajes", force: :cascade do |t|
    t.string   "nombre"
    t.text     "mensaje"
    t.text     "respuesta"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_nivel0", force: :cascade do |t|
    t.string   "titulo"
    t.string   "estado"
    t.integer  "posicion"
    t.integer  "contenido_id"
    t.integer  "usuario_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "enlace"
  end

  add_index "menu_nivel0", ["contenido_id"], name: "index_menu_nivel0_on_contenido_id", using: :btree
  add_index "menu_nivel0", ["usuario_id"], name: "index_menu_nivel0_on_usuario_id", using: :btree

  create_table "menu_nivel1", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "estado"
    t.integer  "posicion"
    t.integer  "menu_nivel0_id"
    t.integer  "contenidos_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "enlace"
  end

  add_index "menu_nivel1", ["contenidos_id"], name: "index_menu_nivel1_on_contenidos_id", using: :btree
  add_index "menu_nivel1", ["menu_nivel0_id"], name: "index_menu_nivel1_on_menu_nivel0_id", using: :btree

  create_table "menu_nivel2", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "tipo"
    t.integer  "estado"
    t.integer  "posicion"
    t.integer  "menu_nivel1_id"
    t.integer  "contenido_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "enlace"
  end

  add_index "menu_nivel2", ["contenido_id"], name: "index_menu_nivel2_on_contenido_id", using: :btree
  add_index "menu_nivel2", ["menu_nivel1_id"], name: "index_menu_nivel2_on_menu_nivel1_id", using: :btree

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

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
