module BF
  class MyTrade
    after_save do
      my_trade_ships = BF::MyTradeShip.recent
      ActionCable.server.broadcast(
        ApplicationCable::Channel::STREAM_NAME,
        type: 'my_trades_table',
        html: ApplicationController.renderer.render(partial: 'my_trade_ships/table', locals: { my_trade_ships: my_trade_ships }),
      )
    end

    def order_size
      0.02
    end
  end

  class << self
    def scalping_worker_class
      Scalping::Basic
    end
  end
end
