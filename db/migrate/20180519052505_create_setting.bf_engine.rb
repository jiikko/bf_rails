# This migration comes from bf_engine (originally 2)
class CreateSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :enabled_fetch, null: false, default: true
      t.boolean :enabled_daemon_sclping_worker, null: false, default: false
      t.integer :max_scalping_worker_count, null: false, default: 1
      t.float :order_size, null: false, default: 0.01
      t.integer :order_range, null: false, default: 400
      t.boolean :enabled_calc_disparity, null: false, default: false
      t.timestamps null: false
    end
  end
end
