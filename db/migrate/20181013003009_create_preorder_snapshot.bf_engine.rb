# This migration comes from bf_engine (originally 8)
class CreatePreorderSnapshot < ActiveRecord::Migration[5.1]
  def change
    create_table :preorder_snapshots do |t|
      t.text :memo
      t.boolean :restored, default: false, null: false

      t.timestamps null: false
    end
  end
end
