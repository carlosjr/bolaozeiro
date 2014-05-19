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

ActiveRecord::Schema.define(version: 20140429231147) do

  create_table "clientes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jogos", force: true do |t|
    t.string   "time_a"
    t.string   "time_b"
    t.integer  "gols_a"
    t.integer  "gols_b"
    t.string   "data"
    t.string   "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "palpites", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "jogo_id"
    t.integer  "gols_a"
    t.integer  "gols_b"
    t.integer  "pontos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nome",       limit: 100
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
