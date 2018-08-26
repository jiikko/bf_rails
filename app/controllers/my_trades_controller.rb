class MyTradesController < ApplicationController
  def create
    @my_trade_ships = BF::MyTradeShip.recent
      if can_order?
        BF::MyTrade.new.run_buy_trade!(params[:price])
        @message = '注文しました'
      else
        @message = 'workerの稼働数が最大に近いので注文しませんでした'
      end
    respond_to do |format|
      format.js
    end
  end

  def cancel
    my_traded = BF::MyTrade.find(params[:id])
    my_traded.cancel_order!
    head :no_content
  end

  def can_order?
    running_worker_count = Resque.workers.select { |worker| worker.job.present? }.count
    max_count = Resque.workers.count
    max_orderable = max_count - 1
    running_worker_count < max_orderable
  end
end
