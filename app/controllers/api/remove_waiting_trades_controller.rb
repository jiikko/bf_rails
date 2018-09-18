class Api::RemoveWaitingTradesController < ApplicationController
  def create
    BF::RemoveWaitingTradeWorker.perform_async
    respond_to do |format|
      format.js do
        @message = '約定確認を実行します'
        render 'shared/dialog'
      end
    end
  end
end
