class PricesController < ApplicationController
  def index
    respond_to do |format|
      format.js do
        @last_trade = BF::Trade.last
        @price_table = BF::Trade.price_table
      end
    end
  end
end
