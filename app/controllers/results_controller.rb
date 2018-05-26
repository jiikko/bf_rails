class ResultsController < ApplicationController
  def index
    includes = { trade_ship: [:buy_trade, :sell_trade] }
    @tasks_table = BF::ScalpingTask.order('created_at desc').includes(includes).
      where('created_at > ?', 2.week.ago).group_by { |x| x.created_at.strftime('%Y/%m/%d') }
  end
end
