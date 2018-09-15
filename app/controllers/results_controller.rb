class ResultsController < ApplicationController
  def index
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
end
