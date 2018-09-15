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

ActiveRecord::Schema.define(version: 20180609030601) do

  create_table "my_trade_ships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "buy_trade_id", null: false
    t.integer "sell_trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sell_trade_id", "buy_trade_id"], name: "index_my_trade_ships_on_sell_trade_id_and_buy_trade_id", unique: true
  end

  create_table "my_trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "kind", null: false
    t.integer "status", null: false
    t.integer "price", null: false
    t.decimal "size", precision: 10, scale: 8, null: false
    t.string "order_id"
    t.string "order_acceptance_id"
    t.text "error_trace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "params"
  end

  create_table "scalping_tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "trade_ship_id"
    t.datetime "buy_succeed_at"
    t.datetime "sell_succeed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_ship_id"], name: "index_scalping_tasks_on_trade_ship_id"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "enabled_fetch", default: true, null: false
    t.boolean "enabled_daemon_sclping_worker", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_scalping_worker_count", default: 1, null: false
    t.float "order_size", limit: 24, default: 0.01, null: false
    t.integer "order_range", default: 400, null: false
    t.boolean "enabled_calc_disparity", default: false, null: false
  end

  create_table "summarized_my_trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count", default: 0, null: false
    t.integer "profit", default: 0, null: false
    t.integer "kind", null: false
    t.date "summarized_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["summarized_on", "kind"], name: "index_summarized_my_trades_on_summarized_on_and_kind", unique: true
  end

  create_table "trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at", "price"], name: "index_trades_on_created_at_and_price"
  end

end
