class Api::RemoveWaitingTradesController < ApplicationController
  def create
    BF::RemoveWaitingTradeWorker.perform
    respond_to do |format|
      format.js { head :ok }
    end
  end
end
