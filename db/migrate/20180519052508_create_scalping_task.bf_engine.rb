# This migration comes from bf_engine (originally 5)
class CreateScalpingTask < ActiveRecord::Migration[5.1]
  def change
    create_table :scalping_tasks do |t|
      t.integer :trade_ship_id, index: true
      t.datetime :buy_succeed_at
      t.datetime :sell_succeed_at

      t.timestamps null: false
    end
  end
end
