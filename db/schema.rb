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

ActiveRecord::Schema.define(:version => 20130212181852) do

  create_table "affiche_templates", :force => true do |t|
    t.integer  "teaserwidth"
    t.integer  "teaserheigh"
    t.integer  "teaserx"
    t.integer  "teasery"
    t.integer  "lieuwidth"
    t.integer  "lieuheigh"
    t.integer  "lieux"
    t.integer  "lieuy"
    t.integer  "dhwidth"
    t.integer  "dhheigh"
    t.integer  "dhx"
    t.integer  "dhy"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "fond_file_name"
    t.string   "fond_content_type"
    t.integer  "fond_file_size"
    t.datetime "fond_updated_at"
    t.string   "nom"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "lieus", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "mailings", :force => true do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spectacles", :force => true do |t|
    t.string   "titre"
    t.string   "message"
    t.string   "date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.datetime "start_time"
    t.integer  "lieu_id"
    t.string   "affiche_file_name"
    t.string   "affiche_content_type"
    t.integer  "affiche_file_size"
    t.datetime "affiche_updated_at"
    t.string   "teaser"
  end

  add_index "spectacles", ["lieu_id"], :name => "index_spectacles_on_lieu_id"

  create_table "spectacles_users", :id => false, :force => true do |t|
    t.integer "spectacle_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "nom"
    t.string   "surnom"
    t.string   "prenom"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
