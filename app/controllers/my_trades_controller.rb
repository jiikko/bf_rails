class MyTradesController < ApplicationController
  before_action :set_my_trade_ships

  def index
    respond_to do |format|
      format.js
    end
  end

  def create
    BF::MyTrade.new.run_buy_trade!(params[:price])
    respond_to do |format|
      format.js
    end
  end

  def cancel
    my_traded = BF::MyTrade.find(params[:id])
    my_traded.cancel_order!
    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def set_my_trade_ships
    cond = { my_trades: { status: BF::MyTrade.statuses[:requested]} }
    base_query = BF::MyTradeShip.joins(:buy_trade).includes(:buy_trade, :sell_trade).order(id: :desc).limit(5)
    @my_trade_ships = base_query.where(cond).to_a
    @my_trade_ships.concat(base_query.where.not(cond).limit(5))
    sell_query = BF::MyTradeShip.joins(:sell_trade).preload(:buy_trade, :sell_trade).order(id: :desc).limit(10)
    @my_trade_ships.concat(sell_query.where(my_trades: { status: BF::MyTrade.statuses[:selling], created_at: ((2.days.ago)..Time.now)}))
    @my_trade_ships.sort_by! { |x| - x.id }
    @my_trade_ships.uniq!
  end
end
