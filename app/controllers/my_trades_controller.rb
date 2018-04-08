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
    @my_trade_ships = BF::MyTradeShip.limit(5).order(id: :desc)
  end
end
