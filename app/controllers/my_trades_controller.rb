class MyTradesController < ApplicationController
  before_action :set_my_trade_ships

  def index
    respond_to do |format|
      format.js do
      end
    end
  end

  def create
    BF::MyTrade.new.run_buy_trade!(params[:price])
    respond_to do |format|
      format.js
    end
  end

  private

  def set_my_trade_ships
    cond = { my_trades: { status: BF::MyTrade.statuses[:requested]} }
    @my_trade_ships = BF::MyTradeShip.joins(:buy_trade).order(id: :desc).limit(7).where(cond).to_a
    @my_trade_ships.concat(BF::MyTradeShip.joins(:buy_trade).where.not(cond).order(id: :desc).limit(5))
    @my_trade_ships.sort_by! { |x| - x.id }
  end
end
