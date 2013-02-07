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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130207020325) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lieus", :force => true do |t|
    t.string   "nom"
    t.string   "adresse"
    t.string   "gMapUrl"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "joueur_id"
    t.integer  "jouedans_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "participations", ["jouedans_id"], :name => "index_participations_on_jouedans_id"
  add_index "participations", ["joueur_id", "jouedans_id"], :name => "index_participations_on_joueur_id_and_jouedans_id", :unique => true
  add_index "participations", ["joueur_id"], :name => "index_participations_on_joueur_id"

  create_table "spectacles", :force => true do |t|
    t.string   "titre"
    t.string   "message"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "start_time"
    t.integer  "lieu_id"
  end

  add_index "spectacles", ["lieu_id"], :name => "index_spectacles_on_lieu_id"

  create_table "spectacles_users", :id => false, :force => true do |t|
    t.integer "spectacle_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "nom"
    t.string   "email"
    t.string   "surnom"
    t.string   "prenom"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users_spectacles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "spectacle_id"
  end

  add_index "users_spectacles", ["spectacle_id"], :name => "index_users_spectacles_on_spectacle_id"
  add_index "users_spectacles", ["user_id"], :name => "index_users_spectacles_on_user_id"

end
