require 'rails_helper'

describe PricesController do
  describe 'GET #index' do
    it 'be success' do
      BF::Trade.create!(price: 0)
      get prices_path(format: :js), xhr: true
      expect(response).to be_success
    end
  end
end
