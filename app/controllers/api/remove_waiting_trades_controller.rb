class Api::RemoveWaitingTradesController < ApplicationController
  def create
    BF::RemoveWaitingTradeWorker.perform_async
    @message = '約定確認を実行します'
    respond_to do |format|
      format.js { render 'shared/dialog' }
    end
  end
end
