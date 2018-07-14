class ChartsController < ApplicationController
  def index
    @current_day = params[:day] || DateTime.now.to_date.to_s
  end

  def day
    max_price = BF::Trade.where(created_at: current_day.all_day).maximum(:price)
    min_price = BF::Trade.where(created_at: current_day.all_day).where('price > 0').minimum(:price)
    # https://stackoverflow.com/questions/9680144/mysql-date-time-round-to-nearest-hour
    trades = BF::Trade.
      where(created_at: current_day.all_day).
      select('FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) - MOD(UNIX_TIMESTAMP(created_at),300)) AS time',
             'max(price) max_price',
             'min(price) min_price').
      group("time")
    trades = trades.to_a.map { |t| t.time = (t.time + 9.hour).strftime('%H%M%S').to_i; t }

    render json: {
      trades: trades,
      min_price: min_price,
      max_price: max_price,
      auto_succeed_my_trades: auto_succeed_my_trades,
      manual_succeed_my_trades: manual_succeed_my_trades,
    }
  end

  private

  def current_day
    params[:id].to_time
  end

  def manual_succeed_my_trades
  end

  def auto_succeed_my_trades
    ships = BF::MyTradeShip.succeed.
      includes(:scalping_task, :sell_trade, :buy_trade).
      where(created_at: current_day.all_day)
    ships.map do |ship|
      { start: (ship.buy_trade.created_at + 9.hour).strftime('%H%M%S').to_i,
        end: (ship.sell_trade.updated_at + 9.hour).strftime('%H%M%S').to_i,
      }
    end
  end
end
