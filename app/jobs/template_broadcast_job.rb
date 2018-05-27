class TemplateBroadcastJob < ApplicationJob
  queue_as :normal

  def perform
    ActionCable.server.broadcast(ApplicationCable::Channel::STREAM_NAME, html: render)
  end

  private

  def render
    my_trade_ships = BF::MyTradeShip.recent
    ApplicationController.renderer.render(partial: 'my_trades/table', locals: { my_trade_ships: my_trade_ships })
  end
end
