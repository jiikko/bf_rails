class MessageBroadcastJob < ApplicationJob
  queue_as :normal

  def perform
    ActionCable.server.broadcast 'm:1', message: render
  end

  private

  def render
    @my_trade_ships = BF::MyTradeShip.running.includes(:scalping_task, :sell_trade, :buy_trade).to_a
    @my_trade_ships.concat(BF::MyTradeShip.limit(8).order(id: :desc).includes(:scalping_task, :sell_trade, :buy_trade))
    @my_trade_ships.sort_by! { |x| - x.id }
    @my_trade_ships.uniq!
    ApplicationController.renderer.render(partial: 'my_trades/table', locals: { my_trade_ships: @my_trade_ships })
  end
end
