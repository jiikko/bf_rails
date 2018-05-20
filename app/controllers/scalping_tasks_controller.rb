class ScalpingTasksController < ApplicationController
  def index
    @tasks = BF::ScalpingTask.includes(trade_ship: [{ buy_trade: :sell_trade }, :sell_trade]).
      limit(5).
      order(created_at: :desc)
  end
end
