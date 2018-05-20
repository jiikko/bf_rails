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
    @my_trade_ships = BF::MyTradeShip.running.includes(:sell_trade, buy_trade: :sell_trade).to_a
    @my_trade_ships.concat(BF::MyTradeShip.limit(8).order(id: :desc).includes(:sell_trade, buy_trade: :sell_trade))
    @my_trade_ships.sort_by! { |x| - x.id }
    @my_trade_ships.uniq!
  end
end
