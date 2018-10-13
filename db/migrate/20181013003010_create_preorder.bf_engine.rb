# This migration comes from bf_engine (originally 9)
class CreatePreorder < ActiveRecord::Migration[5.1]
  def change
    create_table :preorders do |t|
      t.integer :preorder_snapshot_id, null: false, index: true
      t.integer :kind, null: false
      t.integer :price, null: false
      t.decimal :size, precision:10, scale: 8, null: false

      t.timestamps null: false
    end
  end
end
