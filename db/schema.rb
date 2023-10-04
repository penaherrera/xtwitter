# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_04_194838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_authors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_authors_on_reset_password_token", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_bookmarks_on_author_id"
    t.index ["tweet_id"], name: "index_bookmarks_on_tweet_id"
  end

  create_table "create_join_table_hastags_tweets", force: :cascade do |t|
    t.string "hashtags"
    t.string "tweets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "following_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["following_id"], name: "index_followers_on_following_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_likes_on_author_id"
    t.index ["tweet_id"], name: "index_likes_on_tweet_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "content"
    t.bigint "tweet_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_quotes_on_author_id"
    t.index ["tweet_id"], name: "index_quotes_on_tweet_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "content"
    t.bigint "tweet_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_replies_on_author_id"
    t.index ["tweet_id"], name: "index_replies_on_tweet_id"
  end

  create_table "retweets", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_retweets_on_author_id"
    t.index ["tweet_id"], name: "index_retweets_on_tweet_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "hashtag_id", null: false
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id"], name: "index_taggings_on_hashtag_id"
    t.index ["tweet_id"], name: "index_taggings_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "body"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_tweets_on_author_id"
  end

  add_foreign_key "bookmarks", "authors"
  add_foreign_key "bookmarks", "tweets"
  add_foreign_key "followers", "authors", column: "follower_id"
  add_foreign_key "followers", "authors", column: "following_id"
  add_foreign_key "likes", "authors"
  add_foreign_key "likes", "tweets"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "tweets"
  add_foreign_key "replies", "authors"
  add_foreign_key "replies", "tweets"
  add_foreign_key "retweets", "authors"
  add_foreign_key "retweets", "tweets"
  add_foreign_key "taggings", "hashtags"
  add_foreign_key "taggings", "tweets"
  add_foreign_key "tweets", "authors"
end
