# This migration comes from bf_engine (originally 2)
class CreateSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :enabled_fetch, null: false, default: true
      t.timestamps null: false
    end
  end
end
