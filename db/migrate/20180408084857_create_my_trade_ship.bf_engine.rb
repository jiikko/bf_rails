# This migration comes from bf_engine (originally 4)
class CreateMyTradeShip < ActiveRecord::Migration[5.1]
  def change
    create_table :my_trade_ships do |t|
      t.integer :buy_trade_id, null: false
      t.integer :sell_trade_id

      t.index [:sell_trade_id, :buy_trade_id], unique: true
      t.timestamps null: false
    end
  end
end
