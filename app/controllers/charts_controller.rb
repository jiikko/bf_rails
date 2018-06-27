class ChartsController < ApplicationController
  def index
    @max_price = BF::Trade.maximum(:price)
    @min_price = BF::Trade.minimum(:price)
  end

  def day
    day = params[:id].to_time
    @trades = BF::Trade.
      select("DATE_FORMAT(created_at, '%Y/%m/%d %H:%i:00') as time", 'max(price) max_price', 'min(price) min_price').
      where(created_at: day.all_day).
      group("time")
    render json: @trades
  end
end
