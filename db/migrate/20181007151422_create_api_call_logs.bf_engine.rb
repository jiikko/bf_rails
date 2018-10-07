# This migration comes from bf_engine (originally 7)
class CreateApiCallLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :api_call_logs do |t|
      t.integer :api_type, null: false
      t.string :request_body
      t.string :response_body
      t.text :error_trace
      t.integer :response_code

      t.timestamps null: false
      t.index [:api_type, :created_at]
    end
  end
end
