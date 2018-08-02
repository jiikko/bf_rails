class MyTradeShipsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @my_trade_ships = BF::MyTradeShip.
          includes(:buy_trade, :sell_trade, :scalping_task).
          order(id: :desc).page(params[:page])
      end
      format.js do
        @my_trade_ships = BF::MyTradeShip.recent
      end
    end
  end
end
