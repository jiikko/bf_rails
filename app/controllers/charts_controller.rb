class ChartsController < ApplicationController
  def index
    @max_price = BF::Trade.maximum(:price)
    @min_price = BF::Trade.minimum(:price)
  end
end
