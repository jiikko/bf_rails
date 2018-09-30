class ResultsController < ApplicationController
  CACHE_KEY = 'last_succeed_id'

  def index
    recalc_if_need!
    @summarized_my_trades = BF::SummarizedMyTrade.where('summarized_on > ?', 2.week.ago).order(summarized_on: :desc)
    @total_summarized_my_trade = @summarized_my_trades.
      group(:summarized_on, :kind).
      select('sum(count) sum_count', 'sum(profit) sum_profit', 'kind').
      group_by(&:kind)
  end

  def recalc
    BF::SummarizedMyTrade.summarize!
    redirect_to results_path, notice: '再計算が完了しました'
  end

  def recalc_if_need!
    cached_last_succeed_id = Rails.cache.fetch(CACHE_KEY) || BF::MyTradeShip.succeed.last.id
    current_last_succeed_id = BF::MyTradeShip.succeed.last.id
    if cached_last_succeed_id.nil?
      Rails.cache.write(CACHE_KEY, current_last_succeed_id)
    end
    unless cached_last_succeed_id == current_last_succeed_id
      BF::SummarizedMyTrade.summarize!
      Rails.cache.write(CACHE_KEY, current_last_succeed_id)
    end
  end
end
