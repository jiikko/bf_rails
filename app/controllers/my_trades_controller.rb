class MyTradesController < ApplicationController
  def create
    BF::MyTrade.new.run_buy_trade!(params[:price])
    @my_trade_ships = BF::MyTradeShip.recent
    respond_to do |format|
      format.js
    end
  end

  def cancel
    my_traded = BF::MyTrade.find(params[:id])
    my_traded.cancel_order!
    head :no_content
  end
end
