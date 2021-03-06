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

ActiveRecord::Schema.define(version: 20171212065754) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "ingredient_statuses", force: :cascade do |t|
    t.boolean "status"
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image_url"
    t.float "quantity"
    t.string "quantity_type"
  end

  create_table "instructions", force: :cascade do |t|
    t.string "content"
    t.integer "recipe_id"
    t.integer "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image_url"
  end

  create_table "item_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_id"
    t.integer "price"
  end

  create_table "nutritions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_id"
    t.integer "calories"
    t.integer "protein"
    t.integer "total_fat"
    t.integer "saturated_fat"
    t.integer "trans_fat"
    t.integer "cholesterol"
    t.integer "sodium"
    t.integer "total_carb"
    t.integer "dietary_fiber"
    t.integer "sugars"
    t.integer "vitamin_a"
    t.integer "vitamin_c"
    t.integer "calcium"
    t.integer "iron"
  end

  create_table "pockets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "pockets_recipes", id: false, force: :cascade do |t|
    t.integer "pocket_id"
    t.integer "recipe_id"
    t.index ["pocket_id"], name: "index_pockets_recipes_on_pocket_id"
    t.index ["recipe_id"], name: "index_pockets_recipes_on_recipe_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.integer "instruction_id"
    t.integer "ingredient_id"
    t.boolean "status_ingredient"
    t.boolean "status_instruction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_activity_tracker_id"
  end

  create_table "recipe_statuses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.text "ingredient_statuses"
    t.text "instruction_statuses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
    t.string "review"
    t.text "shopping_bag_status"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "chef_name"
    t.float "cook_time"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image_url"
    t.text "about_info"
    t.integer "chef_id"
    t.integer "grams_per_serving"
    t.index ["item_id"], name: "index_recipes_on_item_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "recipe_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_items", force: :cascade do |t|
    t.integer "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "status"
  end

  create_table "user_activity_trackers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
