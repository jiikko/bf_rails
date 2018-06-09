# This migration comes from bf_engine (originally 6)
class CreateSummarizedMyTrade < ActiveRecord::Migration[5.1]
  def change
    create_table :summarized_my_trades do |t|
      t.integer :count, null: false, default: 0
      t.integer :profit, null: false, default: 0
      t.integer :kind, null: false
      t.date :summarized_on, null: false

      t.timestamps null: false
      t.index [:summarized_on, :kind], unique: true
    end
  end
end
