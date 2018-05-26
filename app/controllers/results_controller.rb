class ResultsController < ApplicationController
  def index
    @ships_table = BF::MyTradeShip.succeed.includes(:scalping_task, :buy_trade, :sell_trade).
      where("#{BF::MyTradeShip.table_name}.created_at > ?", 2.week.ago).order(created_at: :desc).
      group_by { |x| x.created_at.strftime('%Y/%m/%d') }
  end
end
