class Api::RemoveWaitingTradesController < ApplicationController
  def create
    BF::RemoveWaitingTradeWorker.perform
    @message = '約定確認を実行します'
    respond_to do |format|
      format.js
    end
  end
end
