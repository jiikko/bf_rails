class ScalpingTasksController < ApplicationController
  def index
    @tasks = BF::ScalpingTask.includes(trade_ship: [{ buy_trade: :sell_trade }, :sell_trade]).
      limit(20).
      order(created_at: :desc).to_a
    @tasks.concat(BF::ScalpingTask.includes(trade_ship: [{ buy_trade: :sell_trade }, :sell_trade]).running)
    @tasks.sort_by! { |x| - x.id }
    @tasks.uniq!

    respond_to do |format|
      format.js
      format.html
    end
  end
end
