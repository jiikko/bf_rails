class ResultsController < ApplicationController
  CACHE_KEY = 'last_succeed_at'

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
    current_last_succeed_at = BF::MyTradeShip.last_succeed_at
    cached_last_succeed_at = Rails.cache.fetch(CACHE_KEY)
    if cached_last_succeed_at.nil?
      Rails.cache.write(CACHE_KEY, current_last_succeed_at)
    end
    unless cached_last_succeed_at == current_last_succeed_at
      BF::SummarizedMyTrade.summarize!
      Rails.cache.write(CACHE_KEY, current_last_succeed_at)
    end
  end
end
