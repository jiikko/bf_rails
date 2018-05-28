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
    head :no_content
  end

  private

  def set_my_trade_ships
    @my_trade_ships = BF::MyTradeShip.recent
  end
end
