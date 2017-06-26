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

ActiveRecord::Schema.define(version: 20170626043718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_value", null: false
  end

  create_table "battle_action_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battle_actions", force: :cascade do |t|
    t.string "actor_type"
    t.bigint "actor_id"
    t.bigint "battle_action_type_id", null: false
    t.bigint "battle_round_id", null: false
    t.integer "value", null: false
    t.integer "target_remaining_health", null: false
    t.string "target_type"
    t.bigint "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_battle_actions_on_actor_type_and_actor_id"
    t.index ["battle_action_type_id"], name: "index_battle_actions_on_battle_action_type_id"
    t.index ["battle_round_id"], name: "index_battle_actions_on_battle_round_id"
    t.index ["target_type", "target_id"], name: "index_battle_actions_on_target_type_and_target_id"
  end

  create_table "battle_rounds", force: :cascade do |t|
    t.bigint "hunt_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_battle_rounds_on_hunt_id"
  end

  create_table "character_classes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_slots", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_slots_on_character_id"
    t.index ["slot_id"], name: "index_character_slots_on_slot_id"
  end

  create_table "character_traits", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_traits_on_character_id"
    t.index ["trait_id"], name: "index_character_traits_on_trait_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "character_class_id", null: false
    t.string "name", null: false
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_class_id"], name: "index_characters_on_character_class_id"
    t.index ["party_id"], name: "index_characters_on_party_id"
  end

  create_table "hunts", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "monster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "victorious", default: false, null: false
    t.boolean "defeated", default: false, null: false
    t.index ["monster_id"], name: "index_hunts_on_monster_id"
    t.index ["party_id"], name: "index_hunts_on_party_id"
  end

  create_table "item_attributes", force: :cascade do |t|
    t.bigint "item_type_id", null: false
    t.bigint "attribute_type_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_type_id"], name: "index_item_attributes_on_attribute_type_id"
    t.index ["item_type_id"], name: "index_item_attributes_on_item_type_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "slot_id", null: false
    t.bigint "rarity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rarity_id"], name: "index_item_types_on_rarity_id"
    t.index ["slot_id"], name: "index_item_types_on_slot_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "party_id", null: false
    t.bigint "character_slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_items_on_character_id"
    t.index ["character_slot_id"], name: "index_items_on_character_slot_id"
    t.index ["party_id"], name: "index_items_on_party_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_attributes", force: :cascade do |t|
    t.bigint "monster_id", null: false
    t.bigint "attribute_type_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_type_id"], name: "index_monster_attributes_on_attribute_type_id"
    t.index ["monster_id"], name: "index_monster_attributes_on_monster_id"
  end

  create_table "monster_classes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", null: false
  end

  create_table "monster_loots", force: :cascade do |t|
    t.bigint "monster_id", null: false
    t.bigint "item_type_id", null: false
    t.integer "value", null: false
    t.integer "loot_chance", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type_id"], name: "index_monster_loots_on_item_type_id"
    t.index ["monster_id"], name: "index_monster_loots_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "monster_class_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_boss", default: false, null: false
    t.index ["location_id"], name: "index_monsters_on_location_id"
    t.index ["monster_class_id"], name: "index_monsters_on_monster_class_id"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "hunt_energy", null: false
    t.integer "bounty_energy", null: false
    t.bigint "location_id", null: false
    t.integer "experience", null: false
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_parties_on_location_id"
    t.index ["player_id"], name: "index_parties_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_players_on_slug", unique: true
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_class_id", null: false
    t.index ["character_class_id"], name: "index_slots_on_character_class_id"
  end

  create_table "traits", force: :cascade do |t|
    t.bigint "character_class_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "attribute_type_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "exclusive", default: false, null: false
    t.index ["attribute_type_id"], name: "index_traits_on_attribute_type_id"
    t.index ["character_class_id"], name: "index_traits_on_character_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "battle_actions", "battle_action_types"
  add_foreign_key "battle_actions", "battle_rounds"
  add_foreign_key "battle_rounds", "hunts"
  add_foreign_key "character_slots", "characters"
  add_foreign_key "character_slots", "slots"
  add_foreign_key "characters", "character_classes"
  add_foreign_key "characters", "parties"
  add_foreign_key "hunts", "monsters"
  add_foreign_key "hunts", "parties"
  add_foreign_key "item_attributes", "attribute_types"
  add_foreign_key "item_attributes", "item_types"
  add_foreign_key "item_types", "rarities"
  add_foreign_key "item_types", "slots"
  add_foreign_key "items", "character_slots"
  add_foreign_key "items", "characters"
  add_foreign_key "items", "parties"
  add_foreign_key "monster_attributes", "attribute_types"
  add_foreign_key "monster_attributes", "monsters"
  add_foreign_key "monster_loots", "item_types"
  add_foreign_key "monster_loots", "monsters"
  add_foreign_key "monsters", "locations"
  add_foreign_key "monsters", "monster_classes"
  add_foreign_key "parties", "locations"
  add_foreign_key "parties", "players"
  add_foreign_key "slots", "character_classes"
  add_foreign_key "traits", "attribute_types"
  add_foreign_key "traits", "character_classes"
end
