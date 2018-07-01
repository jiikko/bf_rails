class Admin::MyTradesController < ApplicationController
  def index
    @my_trade_ships = BF::MyTradeShip.recent.find_all(&:running?)
  end

  def destroy_all
    BF::MyTradeShip.where(id: params[:cheched_my_trade_ship_id]).each do |ship|
      ship.sell_trade.canceled!
      ship.buy_trade.canceled!
    end
    redirect_to admin_my_trades_path, notice: '削除しました'
  end
end
