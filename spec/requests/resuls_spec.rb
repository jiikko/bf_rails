require 'rails_helper'

describe ResultsController do
  describe 'GET #index' do
    it '集計した値を表示すること' do
      BF::SummarizedMyTrade.create!(count: 2, profit: 10, kind: "manual", summarized_on: Date.today) 
      get results_path
      expect(response.body).to include('<td>10円</td>')
      expect(response).to be_success
    end
  end

  describe 'POST #recalc' do
    it 'リダイレクトをすること' do
      post recalc_results_path
      expect(response).to be_redirect
    end
  end
end
