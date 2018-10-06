require 'rails_helper'

describe ResultsController do
  describe 'GET #index' do
    it '集計した値を表示すること' do
      BF::SummarizedMyTrade.create!(count: 2, profit: 10, kind: "manual", summarized_on: Date.today)
      get results_path
      expect(response.body).to include('<td>10円</td>')
      expect(response).to be_success
    end

    context '未集計の取引があるとき' do
      before do
        sell_trade = BF::MyTrade.create!(price: 100, size: 0.1, status: :succeed, kind: :sell)
        buy_trade  = BF::MyTrade.create!(price: 0, size: 0.1, status: :succeed, kind: :buy)
        running_ship = BF::MyTradeShip.create!(sell_trade_id: sell_trade.id, buy_trade_id: buy_trade.id)
        get results_path
      end

      it '集計すること' do
        expect(BF::SummarizedMyTrade.count).to eq(1)
        expect(BF::SummarizedMyTrade.last.count).to eq(1)
        now =  Time.now + 1.second
        sell_trade = BF::MyTrade.create!(price: 100, size: 0.1, status: :succeed, kind: :sell)
        buy_trade  = BF::MyTrade.create!(price: 0, size: 0.1, status: :succeed, kind: :buy)
        running_ship = BF::MyTradeShip.create!(sell_trade_id: sell_trade.id, buy_trade_id: buy_trade.id, updated_at: now)
        get results_path
        expect(BF::SummarizedMyTrade.count).to eq(1)
        expect(BF::SummarizedMyTrade.last.count).to eq(2)
      end
    end
  end

  describe 'POST #recalc' do
    it 'リダイレクトをすること' do
      post recalc_results_path
      expect(response).to be_redirect
    end
  end
end
