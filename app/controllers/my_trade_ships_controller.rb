class MyTradeShipsController < ApplicationController
  def index
    @my_trade_ships = BF::MyTradeShip.includes(:buy_trade, :sell_trade, :scalping_task).order(id: :desc).page(params[:page])
  end
end
