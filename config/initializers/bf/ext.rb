module BF
  class MyTrade
    after_save do
      my_trade_ships = BF::MyTradeShip.recent
      ActionCable.server.broadcast(
        ApplicationCable::Channel::STREAM_NAME,
        html: ApplicationController.renderer.render(partial: 'my_trades/table', locals: { my_trade_ships: my_trade_ships }),
      )
    end
  end
end
