class Api::ScalpingsController < ApplicationController
  def create
    BF::ScalpingWorker.perform_async
    respond_to do |format|
      format.js { head :ok }
    end
  end
end
