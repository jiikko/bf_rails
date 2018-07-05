class ChartsController < ApplicationController
  def index
    @current_day = params[:day] || DateTime.now.to_date.to_s
  end

  def day
    day = params[:id].to_time
    max_price = BF::Trade.where(created_at: day.all_day).maximum(:price)
    min_price = BF::Trade.where(created_at: day.all_day).where('price > 0').minimum(:price)
    # https://stackoverflow.com/questions/9680144/mysql-date-time-round-to-nearest-hour
    trades = BF::Trade.
      where(created_at: day.all_day).
      select('FROM_UNIXTIME(UNIX_TIMESTAMP(created_at) - MOD(UNIX_TIMESTAMP(created_at),300)) AS time', 
             'max(price) max_price',
             'min(price) min_price').
      group("time")
    trades = trades.to_a.map { |t| t.time = (t.time + 9.hour).strftime('%H%M%S').to_i; t }
    render json: { trades: trades, min_price: min_price, max_price: max_price }
  end
end