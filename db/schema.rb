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

ActiveRecord::Schema.define(:version => 20121219174306) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.integer  "manga_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "chapters", ["manga_id"], :name => "index_chapters_on_manga_id"

  create_table "mangas", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "synopsis"
  end

  add_index "mangas", ["author_id"], :name => "index_mangas_on_author_id"
  add_index "mangas", ["slug"], :name => "index_mangas_on_slug"

  create_table "pages", :force => true do |t|
    t.integer  "chapter_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  add_index "pages", ["chapter_id"], :name => "index_pages_on_chapter_id"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "manga_id"
    t.integer  "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ratings", ["user_id", "manga_id", "rating"], :name => "index_ratings_on_user_id_and_manga_id_and_rating", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "admin"
  end

end
