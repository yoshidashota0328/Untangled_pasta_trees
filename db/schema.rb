# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_211_208_150_204) do
  create_table 'layers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'positionX', default: 0, null: false
    t.integer 'positionY', default: 0, null: false
    t.string 'title'
    t.text 'body'
    t.integer 'parent_id'
    t.integer 'user_id'
    t.integer 'tree_id'
    t.integer 'layer_id'
    t.integer 'db_id'
    t.integer 'del_flag', default: 0
    t.index ['tree_id'], name: 'index_layers_on_tree_id'
    t.index ['user_id'], name: 'index_layers_on_user_id'
  end

  create_table 'trees', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.integer 'leaf_count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.integer 'state', default: 0, null: false
    t.index ['user_id'], name: 'index_trees_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'crypted_password'
    t.string 'salt'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'user_name'
    t.string 'reset_password_token'
    t.datetime 'reset_password_token_expires_at'
    t.datetime 'reset_password_email_sent_at'
    t.integer 'access_count_to_reset_password_page', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token'
    t.index ['user_name'], name: 'index_users_on_user_name', unique: true
  end
end
